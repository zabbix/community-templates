# Zabbix Notification Telegram with Topic

Source:  
[Zabbix-Notification-Telegram](https://github.com/vadikonline1/Zabbix-Repository/tree/c8ac5f1568294be436acb198266eb5d971520faf/Alerts/Media%20types/Telegram_Topic)

## Main Uses

* **Monitoring Notifications**
  Sends automatic notifications via Telegram when issues or anomalies
  are detected in systems monitored by Zabbix.

* **Quick Visualization**
  Provides a quick way to view relevant charts directly in Telegram,
  enabling faster responses from IT teams.

* **Automation**
  Can be integrated into automated workflows to improve incident
  management.

This script is useful for technical support teams that want to stay
informed about system status and react quickly to incidents.

## Telegram Topic Support

Notifications can be sent to a specific Telegram **Message Thread ID
(Topic)** if a trigger or item contains a tag with the following format:

```text
MessageThreadId: <chat_id>
```

Example:

```text
MessageThreadId: 2
```

## Zabbix Settings – Media Types

Create a new media type in Zabbix with the following configuration.

### Media Type Configuration

1. **Name**: `Telegram_Topic`

2. **Type**: `Script`

3. **Script name**: `zbxTT.py`

4. **Script parameters**

   You can specify direct values or use global macros.

   1. `{$ZABBIX.URL}` – use global macros or custom values
   2. `{$ZABBIX.UI.USER}` – use global macros or custom values
   3. `{$ZABBIX.UI.PASS}` – use global macros or custom values
   4. `{$ZABBIX_TELEGRAM_TOKEN}` – use global macros or custom values
   5. `{ALERT.SENDTO}` – Zabbix macro (recommended, do not modify)
   6. `{ALERT.SUBJECT}` – Zabbix macro (recommended, do not modify)
   7. `{ALERT.MESSAGE}` – Zabbix macro (recommended, do not modify)
   8. `{EVENT.TAGS}` – Zabbix macro (recommended, do not modify)
   9. `{ITEM.ID}` – Zabbix macro (recommended, do not modify)
   10. Default topic ID for messages without the `MessageThreadId` tag

       Set the default value to **`1`** or any value so that all messages
       without the `MessageThreadId` tag are sent to the specified topic.

       Example:

       ```text
       -100123456789_1
       ```

       The value after the underscore (`_`) represents the topic ID.

       **Note:**
       You can change the tag key in the script at the following line:

       ```python
       if key.startswith('MessageThreadId')
       ```

![Media Type Parameters Example](https://github.com/user-attachments/assets/3bd80a80-a5d2-4796-9a51-308f10432d2c)

## Message Templates

Navigate to:

```text
Alerts → Media types → Message templates
```

You can create your own templates or customize them using Zabbix macros.

For more details, see the official documentation:
[Zabbix Notifications Media](https://www.zabbix.com/documentation/current/en/manual/config/notifications/media)

### Problem Message

* **Subject**:

  ```text
  ({TRIGGER.SEVERITY}) {TRIGGER.STATUS}: {EVENT.NAME}
  ```

* **Message**:

  ```text
  #TID_{TRIGGER.ID} #EID_{EVENT.ID}
  Host: {HOST.NAME}
  Service problem started at {EVENT.TIME} on {EVENT.DATE}
  Last value: {ITEM.VALUE1}
  Details: {$ZABBIX.URL}/tr_events.php?triggerid={TRIGGER.ID}&eventid={EVENT.ID}
  {TRIGGER.DESCRIPTION}
  ```

### Problem Recovery Message

* **Subject**:

  ```text
  ({TRIGGER.SEVERITY}) Resolved in {EVENT.DURATION}: {TRIGGER.NAME}
  ```

* **Message**:

  ```text
  #TID_{TRIGGER.ID} #EID_{EVENT.ID}
  Host: {HOST.NAME}
  Service problem started at {EVENT.TIME} on {EVENT.DATE}
  Last value: {ITEM.VALUE1}
  ```
