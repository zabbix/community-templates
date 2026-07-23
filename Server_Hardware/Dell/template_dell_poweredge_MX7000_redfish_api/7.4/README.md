# Dell PowerEdge MX7000 OME-M by HTTP v1.3

Plantilla para Zabbix 7.4 que permite monitorear un chassis Dell PowerEdge MX7000 utilizando la API REST de Dell OpenManage Enterprise Modular (OME-M).

## Características

- Descubrimiento automático de PSU
- Estado de PSU
- Voltaje de entrada de PSU
- Corriente de entrada de PSU
- Capacidad de PSU
- Descubrimiento automático de ventiladores
- Estado de ventiladores
- RPM de ventiladores
- Descubrimiento automático de sensores de temperatura
- Temperatura de entrada del chassis
- Temperatura de entrada de sleds
- Estado de subsistemas
- Consumo eléctrico total del chassis

## Requisitos

- Zabbix 7.4 o superior
- Dell OpenManage Enterprise Modular (OME-M)
- Acceso HTTPS hacia OME-M
- Usuario con permisos de lectura sobre DeviceService

## Macros requeridas

| Macro | Descripción |
|---------|---------|
| {$REDFISH.URL} | URL de OME-M |
| {$REDFISH.USER} | Usuario OME-M |
| {$REDFISH.PASSWORD} | Contraseña OME-M |
| {$MX7000.ID} | Device ID del MX7000 dentro de OME-M |
| {$REDFISH.TIMEOUT} | Timeout HTTP |
| {$REDFISH.POWER.MAX} | Umbral de potencia |

## Obtener el MX7000.ID

Consultar:

https://OME-M/api/DeviceService/Devices

https://OME-M/redfish/v1/Chassis

https://OME-M/redfish/v1/Chassis/Members('xxxxx')

Buscar:

## Elementos monitoreados
PSU
Estado
Voltaje
Corriente
Capacidad
FAN
Estado
RPM
Temperatura
Chassis Inlet Temperature
Sled Inlet Temperature
Chassis
Estado de Power
Estado de Fan
Estado de Temperature
Consumo total del chassis

## Limitaciones conocidas

Dell OME-M no expone el consumo individual de cada PSU mediante los endpoints utilizados por esta plantilla.

Actualmente solo se obtiene:

Estado PSU
Voltaje PSU
Corriente PSU
Capacidad PSU

El consumo disponible corresponde al chassis completo.

## Versiones
v1.3
Soporte para macros {$MX7000.ID}
Descubrimiento correcto de PSU
Descubrimiento correcto de FAN
Descubrimiento correcto de sensores de temperatura
Compatibilidad con OME-M validada

## Autor

Andres Rivera Quintero
