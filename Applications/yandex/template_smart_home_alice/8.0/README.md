
# smart_home_yandex

## Overview

Шаблон предназначен для мониторинга устройств умного дома Яндекса (платформа «Дом с Алисой») через облачное API Яндекса по протоколу HTTP без использования внешних скриптов.

Сбор данных выполняется одним HTTP-запросом к методу `/v1.0/user/info` API умного дома. В ответе возвращается список всех устройств, комнат и домов, привязанных к аккаунту Яндекса, а также текущие показания их умений (capabilities) и датчиков (properties). Автоматическое обнаружение (LLD) создаёт по этим данным элементы для каждого устройства, его умения и датчика.

Авторизация запросов выполняется по OAuth-токену, который передаётся в заголовке `Authorization: Bearer <токен>` и задаётся через макрос `{$YANDEX.SMART_HOME.TOKEN}`.

## Requirements

Zabbix version: 8.0 and higher.

## Tested versions

This template has been tested on:

- Yandex Smart Home API v1.0

## Configuration

> Zabbix should be configured according to the instructions in the [Templates out of the box](https://www.zabbix.com/documentation/8.0/manual/config/templates_out_of_the_box) section.

## Setup

Для работы шаблона необходимо получить OAuth-токен с доступом к API умного дома Яндекса. Токен выпускается через сервис Яндекс OAuth и привязывается к зарегистрированному приложению. Подробности описаны в документации [Отладочный токен](https://yandex.ru/dev/id/doc/ru/tokens/debug-token).

1. Зарегистрируйте приложение на странице [Яндекс OAuth](https://oauth.yandex.ru/client/new):

   - в разделе **Доступ к данным** добавьте права **Доступ к устройствам умного дома и сценариям** — для мониторинга достаточно права на просмотр сведений об устройствах умного дома и их показаниях (`iot:view`);
   - в разделе **Redirect URI** в качестве платформы выберите **Веб-сервисы** и укажите Redirect URI `https://oauth.yandex.ru/verification_code`;
   - сохраните приложение и скопируйте его идентификатор **ClientID**.

2. Войдите в Яндекс под той учётной записью, к данным умного дома которой нужен доступ.

3. Откройте в браузере ссылку авторизации, подставив `ClientID` приложения: `https://oauth.yandex.ru/authorize?response_type=token&client_id=<ClientID приложения>`.

4. При необходимости нажмите **Разрешить** на странице подтверждения доступа. Браузер будет перенаправлен на адрес вида `https://oauth.yandex.ru/verification_code#access_token=<OAuth-токен>&token_type=bearer&expires_in=<время жизни в секундах>`.

5. Скопируйте значение параметра `access_token` и укажите его в макросе `{$YANDEX.SMART_HOME.TOKEN}`. Сохраните токен в надёжном месте: сервис Яндекс OAuth не хранит выданные токены в публичном доступе.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$YANDEX.SMART_HOME.TOKEN}|<p>OAuth-токен для доступа к API умного дома Яндекса. Выпускается через сервис Яндекс OAuth для зарегистрированного приложения с правом `iot:view`. Передаётся в заголовке `Authorization: Bearer <токен>`. Инструкция по получению токена: https://yandex.ru/dev/id/doc/ru/tokens/debug-token.</p>||

### Items

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Get data|<p>Мастер-элемент: получает сведения обо всех устройствах, комнатах и домах аккаунта одним запросом к методу `/v1.0/user/info` API умного дома Яндекса. Используется как источник данных для обнаружения устройств и для зависимых элементов с их показаниями.</p>|HTTP agent|yandex.iot.get_data<p>**Preprocessing**</p><ul><li><p>JavaScript: `The text is too long. Please see the template.`</p></li></ul>|

### LLD rule Devices discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Devices discovery||Dependent item|yandex.iot.devices.discovery|

### LLD rule Device capabilities with value mapping discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Device capabilities with value mapping discovery||Nested|yandex.iot.capabilities.discovery.mapping[{#DEVICE.ID}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.capabilities`</p></li></ul>|

### Item prototypes for Device capabilities with value mapping discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|{#DEVICE.NAME}: Параметр `{#CAPABILITY.TYPE}`|<p>Текущее состояние умения `{#CAPABILITY.TYPE}` устройства `{#DEVICE.NAME}`. Дискретное значение, которое отображается с помощью таблицы значений.</p>|Dependent item|yandex.iot.capability.value.mapping[{#DEVICE.ID},{#CAPABILITY.INDEX}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.[?(@.id=='{#DEVICE.ID}')].first()`</p></li><li><p>JSON Path: `The text is too long. Please see the template.`</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|

### Trigger prototypes for Device capabilities with value mapping discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Yandex Smart Home: {#DEVICE.NAME}: Параметр `{#CAPABILITY.TYPE}` изменился|<p>Триггер срабатывает при изменении состояния умения `{#CAPABILITY.TYPE}` устройства `{#DEVICE.NAME}`.</p>|`last(/smart_home_yandex/yandex.iot.capability.value.mapping[{#DEVICE.ID},{#CAPABILITY.INDEX}],#2)<>last(/smart_home_yandex/yandex.iot.capability.value.mapping[{#DEVICE.ID},{#CAPABILITY.INDEX}],#1)`|Info|**Manual close**: Yes|

### LLD rule Device capabilities without value mapping discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Device capabilities without value mapping discovery||Nested|yandex.iot.capabilities.discovery.not_mapping[{#DEVICE.ID}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.capabilities`</p></li></ul>|

### Item prototypes for Device capabilities without value mapping discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|{#DEVICE.NAME}: Параметр `{#CAPABILITY.TYPE}`|<p>Текущее значение умения `{#CAPABILITY.TYPE}` устройства `{#DEVICE.NAME}`. Числовая величина в единицах `{#CAPABILITY.VALUE_UNIT}`.</p>|Dependent item|yandex.iot.capability.value.not_mapping[{#DEVICE.ID},{#CAPABILITY.INDEX}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.[?(@.id=='{#DEVICE.ID}')].first()`</p></li><li><p>JSON Path: `The text is too long. Please see the template.`</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|

### Trigger prototypes for Device capabilities without value mapping discovery

|Name|Description|Expression|Severity|Dependencies and additional info|
|----|-----------|----------|--------|--------------------------------|
|Yandex Smart Home: {#DEVICE.NAME}: Параметр `{#CAPABILITY.TYPE}` изменился|<p>Триггер срабатывает при изменении состояния умения `{#CAPABILITY.TYPE}` устройства `{#DEVICE.NAME}`.</p>|`last(/smart_home_yandex/yandex.iot.capability.value.not_mapping[{#DEVICE.ID},{#CAPABILITY.INDEX}],#2)<>last(/smart_home_yandex/yandex.iot.capability.value.not_mapping[{#DEVICE.ID},{#CAPABILITY.INDEX}],#1)`|Info|**Manual close**: Yes|

### LLD rule Device sensors discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|Device sensors discovery||Nested|yandex.iot.sensors.discovery[{#DEVICE.ID}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.properties`</p></li></ul>|

### Item prototypes for Device sensors discovery

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|{#DEVICE.NAME}: Датчик `{#SENSOR.TYPE}`|<p>Текущее показание датчика `{#SENSOR.TYPE}` устройства `{#DEVICE.NAME}` в единицах `{#SENSOR.VALUE_UNIT}`.</p>|Dependent item|yandex.iot.sensor.value[{#DEVICE.ID},{#SENSOR.INDEX}]<p>**Preprocessing**</p><ul><li><p>JSON Path: `$.[?(@.id=='{#DEVICE.ID}')].first()`</p></li><li><p>JSON Path: `The text is too long. Please see the template.`</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul>|

## Feedback

Please report any issues with the template at [`oscar120584@gmail.com`](mailto:oscar120584@gmail.com)
