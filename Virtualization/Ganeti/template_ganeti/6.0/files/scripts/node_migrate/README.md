# Node Migrate

## Description

Perform node migrate.

## How to use

1. Create a script on `Administration/Scripts`.
2. Configure Scope: `Manual host action` or `Action operation`.
3. Configure Type: `Webhook`.
4. Configure Parameter.
5. Configure Script.

## Parameters

|Name|Value|
|----|-----|
|GanetiMaster|{$GANETI.MASTER}|
|GanetiRAPIPort|{$GANETI.PORT}|
|GanetiRAPIProtocol|{$GANETI.PROTOCOL}|
|Node|{$GANETI.NODE.NAME}|
|Password|{$GANETI.PASSWORD}|
|Username|{$GANETI.USERNAME}|