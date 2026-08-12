# Notifications in Yandex Messenger

## Overview

This template is designed to send notifications from Zabbix via Yandex Messenger (https://yandex.ru/support/business/bot-platform.html#bot-create)

- Allows you to create messages with an indication of importance

- Checks availability and monitors errors when working with the web service.

## Author

Vadim Gurko <VA.Gurko@yandex.ru>

## Setup

The homepage of this template: https://github.com/VAGurko/zabbix-community-templates.git
User guide: https://github.com/VAGurko/zabbix-community-templates.git

1. Register bot: https://yandex.ru/support/business/bot-platform.html#bot-create
2. Import template to zabbix server (Administration - Media types - Import)
3. Create new macros: Administration-General-Macros: {$YM.TOKEN} set type "Secret text" and paste the obtained token.
4. Setup notifications in your profile Zabbix UI.

## Template links

Information and plug-in are available here: https://github.com/VAGurko/zabbix-community-templates/tree/main/Applications/template_app_hrlink

The procedure for making changes is described here: https://github.com/VAGurko/zabbix-community-templates/wiki/Порядок-внесения-изменений-в-шаблон

## Known issues

You can report problems here: https://github.com/VAGurko/zabbix-community-templates/issues

## References

Official website: https://messenger.360.yandex.ru/