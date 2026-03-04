# Microsoft 365 Application Secrets by HTTP

## Overview

This template monitors Microsoft 365 (Microsoft Entra ID / Azure AD) **application registrations** and retrieves all applications that have **client secrets (password credentials)** configured.

It is intended to help administrators identify applications using secrets and support security reviews, secret rotation processes, and compliance monitoring.

The template uses Microsoft Graph API and authenticates via OAuth 2.0 client credentials flow. Data collection is performed using an HTTP agent item with JavaScript preprocessing.

it is baes on the work of [M365 Reporting](https://git.zabbix.com/projects/ZBX/repos/zabbix/browse/templates/app/ms365_http?at=release%2F7.0) by the Zabbix Team

## Requirements

- Zabbix version 7.0 or higher
- Microsoft Entra ID (Azure AD) tenant
- Microsoft Graph API access
- Internet access to:
  - `https://login.microsoftonline.com`
  - `https://graph.microsoft.com`

## Tested versions

- Zabbix 7.0
- Microsoft Graph API v1.0

## Microsoft Entra ID configuration

### Application registration

Create an application registration in Microsoft Entra ID and configure the following:

#### API permissions (Application permissions)

| Permission | Required |
|-----------|----------|
| `Application.Read.All` | Yes |
| `Directory.Read.All` | Recommended |

> **Note:** Admin consent is required for application permissions.

#### Authentication

- Create a **client secret**
- Store the secret securely
- Note the **Tenant ID** and **Application (Client) ID**

## Zabbix configuration

### Host macros

Configure the following macros on the host or template:

| Macro | Description |
|------|------------|
| `{$MS365.TENANT.ID}` | Microsoft Entra ID tenant ID |
| `{$MS365.APP.ID}` | Application (client) ID |
| `{$MS365.APP.SECRET}` | Client secret |
| `{$MS365.HTTP.PROXY}` | Optional HTTP proxy |

### Items

| Name | Type | Description |
|-----|------|------------|
| Get applications with secrets | HTTP agent | Retrieves all application registrations that have client secrets configured |

The item queries the Microsoft Graph endpoint:

```
GET /v1.0/applications
```

and follows pagination using `@odata.nextLink`.

### Data collected

For each application, the following fields are retrieved:

- Application ID
- App (client) ID
- Display name
- Password credentials (client secrets)

Only applications with at least one configured secret are returned.

## Triggers

This template does not include triggers by default.

Users may create custom triggers based on:
- Number of applications with secrets
- Presence of secrets in environments where they are not allowed
- Secret expiration (if extended by additional preprocessing)

## Limitations

- Secret expiration dates are not evaluated by default
- Large tenants may require increased HTTP timeouts
- Microsoft Graph API throttling limits apply
- Only application permissions are supported (delegated permissions are not supported)

## Notes

- The template uses JavaScript compatible with the Zabbix embedded Duktape engine
- The template is read-only and does not modify any Microsoft 365 objects

## License

This template is distributed under the AGPL 3.0 

## Author

Andreas Fies
