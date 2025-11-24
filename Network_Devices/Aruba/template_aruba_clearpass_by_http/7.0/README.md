Adds Certificate and License Monitoring using ClearPass API


This template expects an API user with "client_secret" as the authentication method. (read only)

The following macros are mandatory:

- {$CPPM_API_CLIENT}

- {$CPPM_API_FQDN}

- {$CPPM_API_SECRET}


The "CPPM token discovery" doesn't do a lot of discovering.
It's main use is logging in to the API, retrieving the OAUTH "Bearer" token and updating the data retrieval item's authorization header with this token.

The discovery interval should be below the API client login expiry ( which is 8 hours by default)


template was found here but never accepted as pull request: https://github.com/samwiseg0/zabbix
I did fix some stuff to get it working.
