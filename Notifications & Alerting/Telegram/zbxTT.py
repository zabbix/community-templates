#!/usr/bin/env python3
########################
#  https://t.me/vadikonline1 #
########################
# https://github.com/vadikonline1/Zabbix-Repository
import json
import requests
import sys
import urllib3

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# Script parameters Zabbix.UI, between 'value' you can set your values, if you don't declare them in Script parameters
zabbix_url = sys.argv[1] if len(sys.argv) > 1 else ''
zabbix_username = sys.argv[2] if len(sys.argv) > 2 else ''
zabbix_password = sys.argv[3] if len(sys.argv) > 3 else ''
zabbix_telegram_token = sys.argv[4] if len(sys.argv) > 4 else ''
chat_id = sys.argv[5] if len(sys.argv) > 5 else ''
subject = sys.argv[6] if len(sys.argv) > 6 else ''
message = sys.argv[7] if len(sys.argv) > 7 else ''
event_tags = sys.argv[8] if len(sys.argv) > 8 else ''
item_id = sys.argv[9] if len(sys.argv) > 9 else ''
message_thread_id_default = sys.argv[10] if len(sys.argv) > 10 else '1'

class TelegramNotifier:
    def __init__(self, zabbix_telegram_token, chat_id, parse_mode='markdownv2'):
        self.zabbix_telegram_token = zabbix_telegram_token
        self.chat_id = chat_id
        self.parse_mode = parse_mode
        self.message = ""

    def escape_markup(self, text):
        if self.parse_mode == 'markdownv2':
            return (text.replace('_', '\\_')
                        .replace('*', '\\*')
                        .replace('[', '\\[')
                        .replace(']', '\\]')
                        .replace('(', '\\(')
                        .replace(')', '\\)')
                        .replace('~', '\\~')
                        .replace('`', '\\`')
                        .replace('>', '\\>')
                        .replace('#', '\\#')
                        .replace('+', '\\+')
                        .replace('-', '\\-')
                        .replace('=', '\\=')
                        .replace('|', '\\|')
                        .replace('{', '\\{')
                        .replace('}', '\\}')
                        .replace('.', '\\.')
                        .replace('!', '\\!'))
        return text

    def send_message_with_photo(self, message_thread_id=None, photo_data=None):
        if photo_data is None:
            raise Exception("Error: Photo data is None")

        url_send_message = f'https://api.telegram.org/bot{self.zabbix_telegram_token}/sendPhoto'
        files = {'photo': photo_data}
        params = {
            'chat_id': self.chat_id,
            'caption': self.message,
            'disable_web_page_preview': True,
            'disable_notification': False,
            'message_thread_id': message_thread_id if message_thread_id else None,
            'parse_mode': self.parse_mode
        }
        response = requests.post(url_send_message, files=files, data=params)

        if response.status_code != 200:
            raise Exception(f"Error sending photo: {response.text}")

    def get_chart_png(self, itemid):
        session = requests.Session()
        login_payload = {
            'name': zabbix_username,
            'password': zabbix_password,
            'enter': 'Sign in'
        }

        response = session.post(f'{zabbix_url}/index.php', data=login_payload)
        if "Dashboard" in response.text:
            chart_url = f'{zabbix_url}/chart.php?itemids[]={itemid}&period=3600'
            img_response = session.get(chart_url)

            if img_response.status_code == 200:
                return img_response.content
            else:
                raise Exception(f'Eroare la descărcarea imaginii: {img_response.status_code}')
        else:
            raise Exception('Autentificare eșuată.')

    def check_chat_is_forum(self):
        url = f'https://api.telegram.org/bot{self.zabbix_telegram_token}/getChat?chat_id={self.chat_id}'
        response = requests.get(url)
        
        if response.status_code != 200:
            raise Exception(f"Error getting chat info: {response.text}")

        chat_info = response.json()
        return chat_info.get('result', {}).get('is_forum', False)

def main():
    try:
        tags = {}
        if event_tags.strip():
            for tag in event_tags.split(','):
                key_value = tag.split(':')
                if len(key_value) == 2:
                    key = key_value[0].strip()
                    value = key_value[1].strip()
                    if key.startswith('MessageThreadId'):
                        tags.setdefault(key, []).append(value)

        notifier = TelegramNotifier(zabbix_telegram_token, chat_id)
        notifier.message = f"{subject}\n{message}"

        message_thread_ids = [val for key in tags for val in tags[key]]
        if not message_thread_ids:
            message_thread_ids.append(message_thread_id_default)

        notifier.message = notifier.escape_markup(notifier.message)
        chart_image = notifier.get_chart_png(item_id)

        # Check if the chat is a forum
        is_forum = notifier.check_chat_is_forum()

        for thread_id in message_thread_ids:
            if thread_id:
                if is_forum:
                    notifier.send_message_with_photo(message_thread_id=thread_id, photo_data=chart_image)
                else:
                    notifier.send_message_with_photo(photo_data=chart_image)

        return 'OK'
    except Exception as error:
        raise Exception(f'Sending failed: {error}')

if __name__ == "__main__":
    print(main())
