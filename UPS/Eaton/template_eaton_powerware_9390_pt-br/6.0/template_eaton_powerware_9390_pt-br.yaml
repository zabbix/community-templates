zabbix_export:
  version: '6.0'
  date: '2021-11-21T21:40:00Z'
  groups:
    -
      uuid: 7df96b18c230490a9a0a9e2307226338
      name: Templates
  templates:
    -
      uuid: eb8d1b2535cf463188ca0639db65bd64
      template: Powerware9390-Pt-Br
      name: Powerware9390-Pt-Br
      description: |
        ## Overview
        
        Portuguese items description, graphs names and application, but SNMP keys in English. Input, output, load, battery, external probe, UPS state.
        
        
        
        ## Author
        
        Nilson Espurio
        
        
      groups:
        -
          name: Templates
      items:
        -
          uuid: b7b39c6a1b3d4c8e9d3854558aaf2707
          name: 'Bateria Atual'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.2.3.0
          key: batcur
          delay: '30'
          history: 14d
          trends: 30d
          value_type: FLOAT
          units: A
          tags:
            -
              tag: Application
              value: Bateria
        -
          uuid: 8bbd0537d41f40949fddfa462d73d7ca
          name: 'ICMP Ping'
          type: SIMPLE
          snmp_oid: interfaces.ifTable.ifEntry.ifInOctets.1
          key: icmpping
          delay: '30'
          history: 14d
          trends: 30d
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: 3fd66fce01684818b13328fa28b321c8
              expression: 'max(/Powerware9390-Pt-Br/icmpping,300s)<>1'
              name: '{HOSTNAME} está inacecível via Rede'
              priority: HIGH
        -
          uuid: 6fe9eb53f0514f35b6b9e3b812748f8d
          name: 'Número de Estados Tipo Alarme'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.7.1.0
          key: xupsAlarms
          delay: '30'
          history: 14d
          trends: 30d
          units: PCs
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: 018ac4e8310f4ea89aeb9bb5c2dcdc01
              expression: last(/Powerware9390-Pt-Br/xupsAlarms)<>0
              name: '"Alarmes" on {HOSTNAME}'
              status: DISABLED
              priority: HIGH
        -
          uuid: 3f7dbf98d2fc4235845e696933aa27e5
          name: 'Capacidade Bateria'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.2.4.0
          key: xupsBatCapacity
          delay: '30'
          history: 14d
          trends: 30d
          units: '%'
          tags:
            -
              tag: Application
              value: Bateria
        -
          uuid: 9541a53dec764228814e44a33bef57e3
          name: 'Tempo Bateria Restante'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.2.1.0
          key: xupsBatTimeRemaining
          delay: '30'
          history: 14d
          trends: 30d
          value_type: FLOAT
          units: min
          preprocessing:
            -
              type: MULTIPLIER
              parameters:
                - '0.016666667'
          tags:
            -
              tag: Application
              value: Bateria
        -
          uuid: fbc2f726cb124a518d875260eb498b53
          name: 'Voltagem da Bateria'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.2.2.0
          key: xupsBatVoltage
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Bateria
        -
          uuid: 6e1dfedb99764f958a0c400b02f3db7e
          name: 'Frequência do Byppas'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.5.1.0
          key: xupsBypassFrequency
          delay: '30'
          history: 14d
          trends: 30d
          units: Hz
          preprocessing:
            -
              type: MULTIPLIER
              parameters:
                - '0.1'
          tags:
            -
              tag: Application
              value: Bypass
        -
          uuid: 838952ccc3c8472a9279a83de84f3f69
          name: 'Tensão de Byppas A-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.5.3.1.2.1
          key: xupsBypassVoltagea
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Bypass
        -
          uuid: 752a3a6175ab42e5a24423b5fe02e0b6
          name: 'Tensão de Byppas B-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.5.3.1.2.2
          key: xupsBypassVoltageb
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Bypass
        -
          uuid: a81146dbc482422f871820a5393f281a
          name: 'Tensão de Byppas C-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.5.3.1.2.3
          key: xupsBypassVoltagec
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Bypass
        -
          uuid: 74f4e1414cff4ef69bf3a714ae8f4fb3
          name: 'Humidade Sensor Remoto'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.6.6.0
          key: xupsEnvRemoteHumidity
          delay: '30'
          history: 14d
          trends: 30d
          units: '%'
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: adff50e674af473098e49381e5872854
              expression: last(/Powerware9390-Pt-Br/xupsEnvRemoteHumidity)>75
              name: 'Humidade Relativa na UPS não está normal'
              priority: HIGH
        -
          uuid: db5b6dcbc1d74b539fb9e6d7ee3518da
          name: 'Temperatura Sensor Remoto'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.6.5.0
          key: xupsEnvRemoteTemp
          delay: '30'
          history: 14d
          trends: 30d
          units: C
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: f97a144344564ff383328e4f8b4b4ae9
              expression: last(/Powerware9390-Pt-Br/xupsEnvRemoteTemp)>26
              name: 'Temperatura na UPS não está normal'
              priority: HIGH
        -
          uuid: 275b899af5144638b03f6a549e7529ed
          name: 'Corrente de Entrada A'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.4.1.3.1
          key: xupsInputCurrenta
          delay: '30'
          history: 14d
          trends: 30d
          units: А
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: cd9f4d7d819c416683a2f43d5ee43a26
          name: 'Corrente de Entrada B'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.4.1.3.2
          key: xupsInputCurrentb
          delay: '30'
          history: 14d
          trends: 30d
          units: А
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: f0070f94642a46709a472acf2bea76df
          name: 'Corrente de Entrada C'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.4.1.3.3
          key: xupsInputCurrentc
          delay: '30'
          history: 14d
          trends: 30d
          units: А
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: 61a02dce88d94cd181e9bf65b3a21dd7
          name: 'Frequência de Entrada'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.1.0
          key: xupsInputFrequency
          delay: '30'
          history: 14d
          trends: 30d
          units: Hz
          preprocessing:
            -
              type: MULTIPLIER
              parameters:
                - '0.1'
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: 67962006dcf348f8b2254b1f60880dd8
          name: 'Número de Frequência ou Tensão Anormais'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.2.0
          key: xupsInputLineBads
          delay: '30'
          history: 14d
          trends: 30d
          tags:
            -
              tag: Application
              value: 'Status da UPS'
        -
          uuid: da86f2e9019d4433b35f77a3ae014d10
          name: 'Status de Entrado do No-break'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.5.0
          key: xupsInputSource
          delay: '30'
          history: 14d
          trends: 30d
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: 1278daaadf0f4ce5b45fab8ae3128e2f
              expression: last(/Powerware9390-Pt-Br/xupsInputSource)=4
              name: '{HOSTNAME} está em Bypass'
              priority: AVERAGE
            -
              uuid: 1bb8e6190c744460ad0dff87146b0807
              expression: last(/Powerware9390-Pt-Br/xupsInputSource)<3
              name: '{HOSTNAME} falha na fonte de Entrada'
              priority: HIGH
        -
          uuid: bdd9db032fdf453bab9189bf913553f0
          name: 'Tensão Entrada A-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.4.1.2.1
          key: xupsInputVoltage
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: 556aa51261474944aef58e5b0d4326c8
          name: 'Tensão de Entrada B-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.4.1.2.2
          key: xupsInputVoltageb
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: ce5afc5f0393488c9f2c71233208df98
          name: 'Tensão de Entrada C-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.3.4.1.2.3
          key: xupsInputVoltagec
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Entrada
        -
          uuid: 2acb7bae6e8541dc8fc4a7927bbc22d6
          name: 'Corrente de Saída A'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.3.1
          key: xupsOutputCurrenta
          delay: '30'
          history: 14d
          trends: 30d
          units: А
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: f4949ef408b3499bbf00ceffb3cd2367
          name: 'Corrente de Saída B'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.3.2
          key: xupsOutputCurrentb
          delay: '30'
          history: 14d
          trends: 30d
          units: А
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: 224b71fd297642af9f2f2a133c1470be
          name: 'Corrente de Saída C'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.3.3
          key: xupsOutputCurrentc
          delay: '30'
          history: 14d
          trends: 30d
          units: А
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: 52c4b11b363047d1b3fffe8a43b1479b
          name: 'Frequência de Saída'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.2.0
          key: xupsOutputFrequency
          delay: '30'
          history: 14d
          trends: 30d
          value_type: FLOAT
          units: Hz
          preprocessing:
            -
              type: MULTIPLIER
              parameters:
                - '0.1'
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: 96cb62fc29e54423a72325fc26f64eeb
          name: 'Status da UPS'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.5.0
          key: xupsOutputSource
          delay: '30'
          history: 14d
          trends: 30d
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: 51a390a6d08b4565b71683502a367e96
              expression: last(/Powerware9390-Pt-Br/xupsOutputSource)<4
              name: '{HOSTNAME} Checagem de Status da UPS!'
              priority: WARNING
            -
              uuid: f344483fa2064b88bf01a9660c460680
              expression: last(/Powerware9390-Pt-Br/xupsOutputSource)=11
              name: '{HOSTNAME} está em Manual Bypass'
              priority: WARNING
            -
              uuid: 6e6caba9df2446bbaff740d52989288b
              expression: last(/Powerware9390-Pt-Br/xupsOutputSource)=4
              name: '{HOSTNAME} está no Automático Bypass'
              priority: WARNING
            -
              uuid: 7b332e278f444c75825bd82b2ef32158
              expression: last(/Powerware9390-Pt-Br/xupsOutputSource)=5
              name: '{HOSTNAME} na Bateria'
              priority: AVERAGE
        -
          uuid: 8d3eba91c37b4aab8aed141ba31fb89c
          name: 'Tensão de Saída A-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.2.1
          key: xupsOutputVoltagea
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: d28897d7acd448ca9f8eb2a9b61010d7
          name: 'Tensão de Saída B-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.2.2
          key: xupsOutputVoltageb
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: e03a8c0adb0341d38fde996698459313
          name: 'Tensão de Saída C-N'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.2.3
          key: xupsOutputVoltagec
          delay: '30'
          history: 14d
          trends: 30d
          units: V
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: 2ef9641929dd4879b9c934d5bcda67af
          name: 'Potência de Saída Fase A'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.4.1
          key: xupsOutputWattsa
          delay: '30'
          history: 14d
          trends: 30d
          units: W
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: 79b0bb6e1dd84e9faab58bd5d00f7359
          name: 'Potência de Saída Fase B'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.4.2
          key: xupsOutputWattsb
          delay: '30'
          history: 14d
          trends: 30d
          units: W
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: a8bf8912a7774766802c1fc3cd7c4397
          name: 'Potência de Saída Fase C'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.4.4.1.4.3
          key: xupsOutputWattsc
          delay: '30'
          history: 14d
          trends: 30d
          units: W
          tags:
            -
              tag: Application
              value: Saída
        -
          uuid: 15adfb51e6474139ac0e1d190796fcb9
          name: 'Status do Teste da Bateria'
          type: SNMP_AGENT
          snmp_oid: 1.3.6.1.4.1.534.1.8.2.0
          key: xupsTestBatteryStatus
          delay: '30'
          history: 14d
          trends: 30d
          tags:
            -
              tag: Application
              value: 'Status da UPS'
          triggers:
            -
              uuid: 6050a6600bed494a8f104aa3e267e446
              expression: last(/Powerware9390-Pt-Br/xupsTestBatteryStatus)=3
              name: '{HOSTNAME} teste de Bateria Falhou'
              priority: HIGH
  graphs:
    -
      uuid: a7925fd977074dd09f16c0ea6cc50b05
      name: 'Влажность в пом. ИБП'
      ymin_type_1: FIXED
      ymax_type_1: FIXED
      graph_items:
        -
          color: '009900'
          item:
            host: Powerware9390-Pt-Br
            key: xupsEnvRemoteHumidity
    -
      uuid: 70c7ed19541f453681b2cc924ed2128c
      name: 'Выходная мощность'
      show_work_period: 'NO'
      show_triggers: 'NO'
      graph_items:
        -
          color: '009900'
          item:
            host: Powerware9390-Pt-Br
            key: xupsOutputWattsa
        -
          sortorder: '1'
          color: 3333FF
          item:
            host: Powerware9390-Pt-Br
            key: xupsOutputWattsc
        -
          sortorder: '2'
          color: FF3333
          item:
            host: Powerware9390-Pt-Br
            key: xupsOutputWattsb
    -
      uuid: 484b1d0f6de546749c67e5fa1c974c8d
      name: 'Напряжение на входе'
      show_triggers: 'NO'
      graph_items:
        -
          color: '009900'
          item:
            host: Powerware9390-Pt-Br
            key: xupsInputVoltage
        -
          sortorder: '1'
          color: EE0000
          item:
            host: Powerware9390-Pt-Br
            key: xupsInputVoltagec
        -
          sortorder: '2'
          color: 0000EE
          item:
            host: Powerware9390-Pt-Br
            key: xupsInputVoltageb
    -
      uuid: 5a1d8ea98ce3486f86c1a30362f61a3d
      name: 'Температура в 108 (ИБП)'
      yaxismin: '10'
      yaxismax: '30'
      ymin_type_1: FIXED
      ymax_type_1: FIXED
      graph_items:
        -
          color: '009900'
          item:
            host: Powerware9390-Pt-Br
            key: xupsEnvRemoteTemp
    -
      uuid: 50e5b985c26d4b53a7e32208f5009f41
      name: 'Ток на входе'
      graph_items:
        -
          color: '009900'
          item:
            host: Powerware9390-Pt-Br
            key: xupsInputCurrenta
        -
          sortorder: '1'
          color: FF3333
          item:
            host: Powerware9390-Pt-Br
            key: xupsInputCurrentb
        -
          sortorder: '2'
          color: 3333FF
          item:
            host: Powerware9390-Pt-Br
            key: xupsInputCurrentc
