Subject: 
```
{HOST.NAME}: Updated problem in {EVENT.AGE} - {EVENT.NAME}
```

Message:
```
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
/* ===== BASE ===== */
body, table, td, p, a { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI',  Roboto, Helvetica, Arial, sans-serif; }
body { margin: 0; padding: 0; background-color: #f8fafc; }
table { border-collapse: collapse; }

/* ===== LAYOUT ===== */
.wrapper { width: 100%; background-color: #f8fafc; }
.container { width: 570px; margin: 0 auto; background-color: #ffffff; border-radius: 5px; }
.content { padding: 30px; }

/* ===== SEVERITY ===== */
.severity { color: #ffffff; font-size: 26px; font-weight: bold; text-align: center; padding: 14px 0; border-radius: 4px; margin-bottom: 20px; }

/* ===== ZABBIX DEFAULT COLORS ===== */
.Not { background-color: #97AAB3; }
.Information { background-color: #7499FF; }
.Warning { background-color: #FFC859; color:#3d4852; }
.Average { background-color: #FFA059; }
.High{ background-color: #E97659; }
.Disaster{ background-color: #E45959; }

/* ===== TEXT ===== */
.title { font-size: 20px; font-weight: bold; text-align: center; color: #14a0dc; margin: 0 0 10px; }
.summary { font-size: 16px; color: #3d4852; margin: 0 0 20px; }

/* ===== TABLE ===== */
.info-table { width: 100%; }
.info-table td { padding: 8px 0; font-size: 15px; color: #74787e; }
.info-table .label { width: 35%; font-weight: bold; }
.divider td { border-bottom: 1px solid #edeff2; padding: 10px 0; }

/* ===== BUTTON ===== */
.button { display: inline-block; background-color: #38c172; color: #ffffff; text-decoration: none; padding: 12px 20px; border-radius: 3px; font-size: 15px; }

/* ===== RESPONSIVE ===== */
@media only screen and (max-width: 600px) {
.container { width: 100% !important; border-radius: 0; }
.content { padding: 20px !important; }
.severity { font-size: 22px !important; }
.title { font-size: 18px !important; }
.summary { font-size: 15px !important; }
.info-table td { display: block; width: 100%; }
}
</style>
</head>

<body>
<table class="wrapper" width="100%" cellpadding="0" cellspacing="0" role="presentation">
<tr>
<td align="center">

<table class="container" cellpadding="0" cellspacing="0" role="presentation">
<tr>
<td class="content">

<!-- SEVERITY -->
<div class="severity {TRIGGER.SEVERITY}">
ZABBIX UPDATE
</div>

<!-- TITLE -->
<h1 class="title">
Problem Updated
</h1>

<!-- SUMMARY -->
<p class="summary">
<strong>{TRIGGER.SEVERITY}</strong>: {TRIGGER.NAME}
</p>

<!-- INFO TABLE -->
<table class="info-table" cellpadding="0" cellspacing="0" role="presentation">

<tr>
<td class="label">User</td>
<td>{USER.FULLNAME}</td>
</tr>

<tr>
<td class="label">Action</td>
<td>{EVENT.UPDATE.ACTION}</td>
</tr>

<tr>
<td class="label">Updated at</td>
<td>{EVENT.UPDATE.DATE} {EVENT.UPDATE.TIME}</td>
</tr>

<tr>
<td class="label">Message</td>
<td>{EVENT.UPDATE.MESSAGE}</td>
</tr>

<tr>
<td class="label">Status</td>
<td>{EVENT.STATUS}</td>
</tr>

<tr>
<td class="label">Acknowledged</td>
<td>{EVENT.ACK.STATUS}</td>
</tr>

<tr class="divider"><td colspan="2"></td></tr>

<tr>
<td class="label">Host</td>
<td>{HOST.NAME}</td>
</tr>

<tr>
<td class="label">IP address</td>
<td>{HOST.IP}</td>
</tr>

<tr class="divider"><td colspan="2"></td></tr>

<tr>
<td class="label">Contact</td>
<td>{INVENTORY.CONTACT}</td>
</tr>

<tr>
<td class="label">Location</td>
<td>{INVENTORY.LOCATION}</td>
</tr>

<tr>
<td class="label">Tags</td>
<td>{EVENT.TAGS}</td>
</tr>

</table>

<!-- BUTTON -->
<table width="100%" cellpadding="0" cellspacing="0" role="presentation" style="margin-top:30px;">
<tr>
<td align="center">
<a class="button"
 href="https://zabbix.host/tr_events.php?triggerid={TRIGGER.ID}&eventid={EVENT.ID}"
 target="_blank">
Go to Details
</a>
</td>
</tr>
</table>

</td>
</tr>
</table>

</td>
</tr>
</table>
</body>
</html>
```
