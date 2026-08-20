zabbix_export:
  version: '7.4'
  template_groups:
    - uuid: 36bff6c29af64692839d077febfc7079
      name: 'Templates/Network devices'
    - uuid: 846977d1dfed4968bc5f8bdb363285bc
      name: 'Templates/Operating systems'
  templates:
    - uuid: dd3517f0536a49dc89e09fff62ec369b
      template: 'OPNsense by HTTP-JSON'
      name: 'OPNsense by HTTP-JSON'
      vendor:
        name: community
        version: '0.32'
      groups:
        - name: 'Templates/Network devices'
        - name: 'Templates/Operating systems'
      items:
        - uuid: 1f53848b6556415bad14ca593e242312
          name: 'UPS Battery Charge'
          type: DEPENDENT
          key: nut.battery.charge
          delay: '0'
          units: '%'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''battery.charge'']'
          master_item:
            key: opns.ups.raw
          triggers:
            - uuid: fa0f6277664d4427a8674f572646653a
              expression: 'last(/OPNsense by HTTP-JSON/nut.battery.charge)<{$OPNS.NUT.BAT.LOW}'
              name: 'Battery charge is below {$OPNS.NUT.BAT.LOW}'
              opdata: '{ITEM.LASTVALUE}'
              priority: WARNING
        - uuid: 9905b20ba7b94ceaa89383fef9d65881
          name: 'UPS Battery Load'
          type: DEPENDENT
          key: nut.battery.load
          delay: '0'
          units: '%'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''ups.load'']'
          master_item:
            key: opns.ups.raw
          triggers:
            - uuid: 6d5a3fb4005e499e9431992e931435ba
              expression: 'last(/OPNsense by HTTP-JSON/nut.battery.load)>{$OPNS.NUT.HIGH.LOAD}'
              name: 'High Load on UPS Battery'
              opdata: '{ITEM.LASTVALUE}'
              priority: AVERAGE
        - uuid: 038a71496e2a48eaa790e5ef621e9a8b
          name: 'UPS Battery Runtime'
          type: DEPENDENT
          key: nut.battery.runtime
          delay: '0'
          units: s
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''battery.runtime'']'
          master_item:
            key: opns.ups.raw
          triggers:
            - uuid: 010e7496f772485e863eded1daa1b679
              expression: 'last(/OPNsense by HTTP-JSON/nut.battery.runtime)<{$OPNS.NUT.BAT.RUNTIME}'
              name: 'Remaining battery runtime is low'
              opdata: '{ITEM.LASTVALUE}'
              priority: HIGH
        - uuid: 4dc13074716e448ba307cf03701daaaf
          name: 'UPS Input Frequency'
          type: DEPENDENT
          key: nut.input.frequency
          delay: '0'
          units: Hz
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''input.frequency'']'
          master_item:
            key: opns.ups.raw
        - uuid: 4bdbb273b5eb45d190a07373868f2fa1
          name: 'UPS Input Voltage'
          type: DEPENDENT
          key: nut.input.voltage
          delay: '0'
          units: V
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''input.voltage'']'
          master_item:
            key: opns.ups.raw
        - uuid: 5cf8a50cf85a4be59946184960bc9baa
          name: 'UPS Model'
          type: DEPENDENT
          key: nut.model
          delay: '0'
          value_type: TEXT
          trends: '0'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''ups.model'']'
          master_item:
            key: opns.ups.raw
        - uuid: 5e6a558e1c6d42ca9140213cb709d983
          name: 'UPS Output Voltage'
          type: DEPENDENT
          key: nut.output.voltage
          delay: '0'
          units: V
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''output.voltage'']'
          master_item:
            key: opns.ups.raw
        - uuid: 47bd34b6852b4bb292fa19a682359004
          name: 'UPS Status'
          type: DEPENDENT
          key: nut.status
          delay: '0'
          value_type: TEXT
          trends: '0'
          description: |
            OL = On Line = UPS is powered by mains electricity, supplying power to connected devices.
            OB = On Battery = UPS is running on battery power due to mains failure.
            LB = Low Battery = Battery charge is critically low. UPS will shut down soon.
            RB = Replace Battery = Battery needs replacement (age or health issue).
            HB = High Battery = Battery is fully charged (rare, but possible).
            CHRG = Charging = Battery is currently being charged.
            DISCHRG = Discharging = Battery is discharging (same as OB, but more specific).
            OVER = Overload = UPS is overloaded (load exceeds capacity).
            ALARM = Alarm Active = UPS has triggered an alarm (e.g., overload, battery fault).
            CAL = Calibrating = UPS is performing battery calibration.
            COMMLOST = Communication Lost = Communication with UPS is lost.
            OFF = Off = UPS is powered off.
            ONBATT = On Battery = Same as OB.
            TRIM = Trim = Mains voltage is low, UPS is reducing voltage (step-down).
            BOOST = Boost = Mains voltage is high, UPS is increasing voltage (step-up).
            SYNC = Synchronizing = UPS is synchronizing with mains (rare).
            TEST = Test = Running	UPS is running a self-test.
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.[''ups.status'']'
          master_item:
            key: opns.ups.raw
          triggers:
            - uuid: 1e308c6da595465297a191b4f6abe7fb
              expression: 'find(/OPNsense by HTTP-JSON/nut.status,#1,"like","LB")=1'
              name: 'Battey low'
              priority: DISASTER
            - uuid: 7e29741d0a604e7f9f6a58f473285603
              expression: 'find(/OPNsense by HTTP-JSON/nut.status,#1,"like","OB")=1'
              name: 'UPS on Battery'
              priority: HIGH
        - uuid: ca1cc6c4ceb04a459cfbabea9930a531
          name: 'OPNsense: System activity (raw)'
          type: HTTP_AGENT
          key: opns.activity.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Header block of the process listing, which is the only place the API states how busy the processor actually is. The bulk of the response is the process table itself and is not evaluated, so nothing is stored from it.'
          preprocessing:
            - type: REGEX
              parameters:
                - '(CPU:[^"]+)'
                - \1
          timeout: 15s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/activity/get_activity'
          tags:
            - tag: component
              value: raw
        - uuid: c2dfbbc5575e47d19daabd6e2c7d9dc1
          name: 'OPNsense: Alias tables (raw)'
          type: HTTP_AGENT
          key: opns.alias.raw
          delay: 10m
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Entries held by all pf tables together with the configured ceiling. Polled every ten minutes because block lists and GeoIP feeds move on that scale, not by the second.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/firewall/alias/get_table_size'
          tags:
            - tag: component
              value: raw
        - uuid: fcf7225b97e0426d8acc5d80b142a439
          name: 'CARP: Demotion factor'
          type: DEPENDENT
          key: opns.carp.demotion
          delay: '0'
          description: 'How strongly this node is holding itself back from becoming master. Zero means it is willing; anything above means a subsystem has demoted it, which is the usual reason a node refuses to take over when the peer fails.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.carp.demotion
              error_handler: DISCARD_VALUE
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 3m
          master_item:
            key: opns.raw.interfaces.carp
          tags:
            - tag: component
              value: carp
        - uuid: f9b63e90b8a7473cb3d30ef7e4ad8c12
          name: 'CARP: Maintenance mode'
          type: DEPENDENT
          key: opns.carp.maintenance
          delay: '0'
          description: 'Maintenance mode hands every virtual address to the peer and keeps it there. Worth watching because it is easy to switch on for a planned change and just as easy to forget afterwards, leaving the pair permanently one sided.'
          valuemap:
            name: 'Enabled state'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.carp.maintenancemode
              error_handler: DISCARD_VALUE
            - type: BOOL_TO_DECIMAL
              parameters:
                - ''
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 3m
          master_item:
            key: opns.raw.interfaces.carp
          tags:
            - tag: component
              value: carp
          triggers:
            - uuid: 8509721dbf00419ea296a06b7e1f98f6
              expression: 'min(/OPNsense by HTTP-JSON/opns.carp.maintenance,30m)=1'
              name: 'OPNsense: CARP maintenance mode has been on for 30 minutes'
              priority: WARNING
              description: 'Long enough to suggest it was left on rather than switched on for a change in progress. While it is on there is no redundancy.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: availability
        - uuid: be29426c9d954f1da7d758ab4b7f741c
          name: 'OPNsense: Configuration last changed'
          type: DEPENDENT
          key: opns.config.changed
          delay: '0'
          units: unixtime
          description: 'Timestamp OPNsense records when the configuration is written. Covers every change, not only firewall rules, and needs no extra request because it rides along with the system time that is already polled. The reading is what the firewall itself reports, so a clock that is off shifts it accordingly.'
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  // "Thu Aug 13 12:03:17 UTC 2026". Date.parse is unreliable with this
                  // format, so it is taken apart by position.
                  var m = JSON.parse(value).config.match(
                      /^\w{3}\s+(\w{3})\s+(\d{1,2})\s+(\d{1,2}):(\d{2}):(\d{2})\s+\S+\s+(\d{4})$/);
                  if (m === null) { throw 'cannot read config timestamp: ' + value; }
                  var months = {Jan:0,Feb:1,Mar:2,Apr:3,May:4,Jun:5,Jul:6,Aug:7,Sep:8,Oct:9,Nov:10,Dec:11};
                  return Math.round(Date.UTC(+m[6], months[m[1]], +m[2], +m[3], +m[4], +m[5]) / 1000);
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.raw.load
          tags:
            - tag: component
              value: system
          triggers:
            - uuid: fed19fbe4cd0446b9defc959b7256d10
              expression: 'change(/OPNsense by HTTP-JSON/opns.config.changed)<>0 and last(/OPNsense by HTTP-JSON/opns.config.changed,#2)>0'
              name: 'OPNsense: Configuration has been changed'
              priority: INFO
              description: 'Someone wrote a new configuration. Broader than the ruleset fingerprint, which reacts to rules only, and the two together tell whether a change touched the firewall rules or something else. The second condition suppresses the jump out of a zero, which is what an item reports after a gap in collection rather than a real change.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: 006b445c232e4455b8ed653c13cb104f
          name: 'CPU: Cores'
          type: DEPENDENT
          key: opns.cpu.cores
          delay: '0'
          description: 'Physical core count, needed to put the load average into proportion. Parsed by position rather than by wording, because the source string is translated on a localised firewall.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$[0]'
            - type: REGEX
              parameters:
                - '\(([0-9]+)[^)]*\)\s*$'
                - \1
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1d
          master_item:
            key: opns.cpu.raw
          tags:
            - tag: component
              value: cpu
        - uuid: 6a1b99c362f3490d85328c902b73cdc4
          name: 'CPU: Idle time'
          type: DEPENDENT
          key: opns.cpu.idle
          delay: '0'
          value_type: FLOAT
          units: '%'
          description: 'Share of processor time spent idle. The one figure top(1) states directly, which is why utilization is derived from it rather than the other way round.'
          preprocessing:
            - type: REGEX
              parameters:
                - '([0-9.]+)%\s*idle'
                - \1
          master_item:
            key: opns.activity.raw
          tags:
            - tag: component
              value: cpu
        - uuid: 46b364421d04418db8878cdbea616ed2
          name: 'CPU: Interrupt time'
          type: DEPENDENT
          key: opns.cpu.interrupt
          delay: '0'
          value_type: FLOAT
          units: '%'
          description: 'Share spent servicing hardware interrupts. On a firewall this is largely network cards, and a high figure means the packet rate is close to what the hardware can take, well before the total utilisation looks alarming.'
          preprocessing:
            - type: REGEX
              parameters:
                - '([0-9.]+)%\s*interrupt'
                - \1
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.activity.raw
          tags:
            - tag: component
              value: cpu
        - uuid: bf7c17f8b2094ec391ae4c4f58f45be3
          name: 'CPU load'
          type: DEPENDENT
          key: opns.cpu.load
          delay: '0'
          history: 1d
          value_type: FLOAT
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.loadavg
            - type: REGEX
              parameters:
                - ^(\d+\.\d+)
                - \1
          master_item:
            key: opns.raw.load
          triggers:
            - uuid: 139a626f4d2a486ba7eb21d3eda124bd
              expression: 'min(/OPNsense by HTTP-JSON/opns.cpu.load,5m)>{$OPNS.CPU.LOAD.MAX}'
              name: 'CPU load is high'
              opdata: '{ITEM.LASTVALUE}'
              priority: WARNING
        - uuid: 7d989e887e55448ea9dedc52ada14e4d
          name: 'OPNsense: CPU type (raw)'
          type: HTTP_AGENT
          key: opns.cpu.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Processor model with core and thread count. Static inventory, but polled at the same interval as the load average it is divided into, because a calculated item goes unsupported while a referenced item has no data yet. The dependent item discards unchanged values, so this costs a request rather than history. This is also the only endpoint addressed in camelCase, because the action name carries consecutive capitals that the snake_case spelling does not reproduce; its privilege matches by wildcard, so the spelling raises no access problem.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/cpu_usage/get_c_p_u_type'
          tags:
            - tag: component
              value: raw
        - uuid: 3f4ca8d7a51f40078851cd2ffba320a5
          name: 'CPU: System time'
          type: DEPENDENT
          key: opns.cpu.system
          delay: '0'
          value_type: FLOAT
          units: '%'
          description: 'Share spent in the kernel, which on a firewall is mostly packet forwarding and rule evaluation.'
          preprocessing:
            - type: REGEX
              parameters:
                - '([0-9.]+)%\s*system'
                - \1
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.activity.raw
          tags:
            - tag: component
              value: cpu
        - uuid: cf0c3bd1b1f548e09213d87a27dde773
          name: 'CPU: User time'
          type: DEPENDENT
          key: opns.cpu.user
          delay: '0'
          value_type: FLOAT
          units: '%'
          description: 'Share spent in user space, which covers the web interface, the configuration daemon and plugins such as an IDS.'
          preprocessing:
            - type: REGEX
              parameters:
                - '([0-9.]+)%\s*user'
                - \1
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.activity.raw
          tags:
            - tag: component
              value: cpu
        - uuid: 8043ef39cc2b4391b1aeb307c8fbfc8c
          name: 'CPU: Utilization'
          type: CALCULATED
          key: opns.cpu.util
          value_type: FLOAT
          units: '%'
          params: 100-last(//opns.cpu.idle)
          description: 'Everything that is not idle. Derived from the idle share the firewall reports, because that is the one figure the API states directly and the rest have to be added up otherwise.'
          tags:
            - tag: component
              value: cpu
          triggers:
            - uuid: e8d0b77076fe4903869e67e299b2e7ec
              expression: 'avg(/OPNsense by HTTP-JSON/opns.cpu.util,10m)>{$OPNS.CPU.UTIL.WARN}'
              name: 'OPNsense: CPU utilization is high'
              priority: WARNING
              description: 'Sustained load on the processor. Read alongside the interrupt share: if that dominates, the limit is packet handling rather than anything running on the box.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: performance
        - uuid: 6ebbcee115654039a5735c835bbdaa78
          name: 'Firmware update count'
          type: DEPENDENT
          key: opns.firmware.update.count
          delay: '0'
          history: 30d
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  var data = JSON.parse(value);
                  if (data.status !== 'update' && data.status !== 'upgrade') {
                      return 0;
                  }
                  if (data.all_packages) {
                      return Object.keys(data.all_packages).length;
                  }
                  if (data.all_sets) {
                      return Object.keys(data.all_sets).length;
                  }
                  return 0;
          master_item:
            key: opns.raw.firmware.status
          tags:
            - tag: component
              value: firmware
        - uuid: daba216c1e654377982db23dfad0b0a0
          name: 'Firmware update packages'
          type: DEPENDENT
          key: opns.firmware.update.packages
          delay: '0'
          history: 30d
          value_type: TEXT
          trends: '0'
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  var data = JSON.parse(value);
                  var packages = data.all_packages || data.all_sets || {};
                  var result = [];
                  Object.keys(packages).sort().forEach(function (name) {
                      var pkg = packages[name];
                      result.push(pkg.name + ': ' + pkg.old + ' -> ' + pkg.new + ' (' + pkg.reason + ')');
                  });
                  return result.join('\n');
          master_item:
            key: opns.raw.firmware.status
          tags:
            - tag: component
              value: firmware
        - uuid: c38e9bd38f2749839673580d91239005
          name: 'Firmware update requires reboot'
          type: DEPENDENT
          key: opns.firmware.update.reboot
          delay: '0'
          history: 30d
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.status_reboot
              error_handler: CUSTOM_VALUE
              error_handler_params: '0'
          master_item:
            key: opns.raw.firmware.status
          tags:
            - tag: component
              value: firmware
        - uuid: ec1dbbdb46a1445f9c5595ab24a76083
          name: 'Firmware update status'
          type: DEPENDENT
          key: opns.firmware.update.status
          delay: '0'
          history: 30d
          value_type: TEXT
          trends: '0'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.status
          master_item:
            key: opns.raw.firmware.status
          tags:
            - tag: component
              value: firmware
          triggers:
            - uuid: a5755520c5e2491cb9b44cd9d1f438af
              expression: 'find(/OPNsense by HTTP-JSON/opns.firmware.update.status,#1,"eq","error")=1'
              name: 'OPNsense firmware update check failed'
              opdata: '{ITEM.LASTVALUE}'
              priority: WARNING
              description: 'The OPNsense firmware update check returned an error.'
        - uuid: 68ad33be2ee3422c8b711a243a860ca5
          name: 'Firmware update status message'
          type: DEPENDENT
          key: opns.firmware.update.status_msg
          delay: '0'
          history: 30d
          value_type: TEXT
          trends: '0'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.status_msg
          master_item:
            key: opns.raw.firmware.status
          tags:
            - tag: component
              value: firmware
        - uuid: e525a08df2e24efea29f8b9ceb1cd48a
          name: 'Firewall states current'
          type: DEPENDENT
          key: opns.fw.states.current
          delay: '0'
          history: 1d
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.current
          master_item:
            key: opns.raw.fw.states
          tags:
            - tag: component
              value: firewall
        - uuid: 54937ff84f994bfcba2b4cd2e1d9465d
          name: 'Firewall states max'
          type: DEPENDENT
          key: opns.fw.states.max
          delay: '0'
          history: 1d
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.limit
          master_item:
            key: opns.raw.fw.states
          tags:
            - tag: component
              value: firewall
        - uuid: e077b57bcd454ed0a624523f88d8fbd5
          name: 'Firewall log: Blocked entries'
          type: DEPENDENT
          key: opns.fwlog.block
          delay: '0'
          description: 'Blocked entries in the window the endpoint returns. Meaningful only against the window size, which is what the blocked share divides by.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$[?(@.label == "block")].value.first()'
          master_item:
            key: opns.raw.fw.action
          tags:
            - tag: component
              value: firewall
        - uuid: cc2d8b5a080045c2a5e8d63c6b63e0e3
          name: 'Firewall log: Blocked share'
          type: CALCULATED
          key: opns.fwlog.block.pct
          value_type: FLOAT
          units: '%'
          params: 'last(//opns.fwlog.block) / last(//opns.fwlog.total) * 100'
          description: 'Share of blocked entries among the most recent logged packets. Deliberately a share and not a count: the endpoint returns a fixed window of the last log entries, so the counts always add up to that window size and say nothing on their own. The span of time covered therefore varies with how much the firewall logs, and only rules with logging enabled appear at all. What a normal share looks like differs per site, so this ships without a trigger.'
          tags:
            - tag: component
              value: firewall
        - uuid: ffa7c087de8f4d3b9b69519003b6c95f
          name: 'Firewall log: Window size'
          type: DEPENDENT
          key: opns.fwlog.total
          delay: '0'
          description: 'Number of entries the endpoint reports on. A fixed window of the most recent logged packets, so this normally sits at a constant value, and only rules with logging enabled are counted at all.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$[*].value.sum()'
          master_item:
            key: opns.raw.fw.action
          tags:
            - tag: component
              value: firewall
        - uuid: f6fab497a5734651a596ef0752999120
          name: 'RAW IPsec Phase1'
          type: HTTP_AGENT
          key: opns.ipsec.phase1.raw
          delay: 5m
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.rows
            - type: JAVASCRIPT
              parameters:
                - |
                  // searchPhase1 leaves phase1desc null when the connection carries no description, and the
                  // discovery uses that field as the entity identity in every prototype key. name is always
                  // set, so it stands in. Anyone who does have descriptions keeps the keys they already have.
                  var rows = JSON.parse(value);
                  for (var i = 0; i < rows.length; i++) {
                      var desc = rows[i]['phase1desc'];
                      if (desc === null || desc === undefined || String(desc).trim() === '') {
                          rows[i]['phase1desc'] = rows[i]['name'];
                      }
                  }
                  return JSON.stringify(rows);
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/ipsec/sessions/searchPhase1'
          tags:
            - tag: component
              value: raw
        - uuid: 12982d3c12294f8a8ca6bd0d07b370a1
          name: 'mbuf: Clusters in use'
          type: DEPENDENT
          key: opns.mbuf.cluster.current
          delay: '0'
          description: 'mbuf clusters currently taken from the fixed kernel pool. Grows with the number of packets in flight, not with configured memory.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$[''mbuf-statistics''][''cluster-current'']'
              error_handler: DISCARD_VALUE
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.mbuf.raw
          tags:
            - tag: component
              value: memory
        - uuid: a45aef2894fe4e8fb23fcdda213ed314
          name: 'mbuf: Cluster limit'
          type: DEPENDENT
          key: opns.mbuf.cluster.max
          delay: '0'
          description: 'Upper bound of the cluster pool, set by kern.ipc.nmbclusters. Raising that sysctl is the remedy when the pool runs dry.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$[''mbuf-statistics''][''cluster-max'']'
              error_handler: DISCARD_VALUE
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.mbuf.raw
          tags:
            - tag: component
              value: memory
        - uuid: eceba8258d2a432eb961c6180eee59d1
          name: 'mbuf: Cluster utilization'
          type: CALCULATED
          key: opns.mbuf.cluster.pused
          value_type: FLOAT
          units: '%'
          params: 'last(/{HOST.HOST}/opns.mbuf.cluster.current) / last(/{HOST.HOST}/opns.mbuf.cluster.max) * 100'
          description: 'mbuf clusters are a fixed kernel pool. Once it is exhausted the firewall stops forwarding traffic while still answering ping and reporting free system memory, which makes this failure hard to recognise from the outside.'
          tags:
            - tag: component
              value: memory
          triggers:
            - uuid: 1bff1afca74c4a28a5f7dbcf39c824c7
              expression: 'min(/OPNsense by HTTP-JSON/opns.mbuf.cluster.pused,5m)>{$OPNS.MBUF.UTIL.WARN}'
              name: 'OPNsense: mbuf cluster pool is filling up'
              priority: AVERAGE
              description: 'Approaching the cluster limit. Raise kern.ipc.nmbclusters before it is reached, because exhaustion costs traffic, not just performance.'
              manual_close: 'YES'
              dependencies:
                - name: 'OPNsense: Kernel denied network memory requests'
                  expression: 'change(/OPNsense by HTTP-JSON/opns.mbuf.denied)>0'
              tags:
                - tag: scope
                  value: capacity
        - uuid: e1ec47b6adcd4a94a975339584df83a2
          name: 'mbuf: Denied requests'
          type: DEPENDENT
          key: opns.mbuf.denied
          delay: '0'
          description: 'Sum of the mbuf, cluster and packet allocation failures reported by the kernel. A cumulative counter since boot that should stay at zero for the entire uptime, so the trigger fires on any increase rather than on a threshold.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$[''mbuf-statistics''][''mbuf-failures'',''cluster-failures'',''packet-failures'',''jumbop-failures'',''jumbo9-failures'',''jumbo16-failures'',''sfbufs-alloc-failed''].sum()'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.mbuf.raw
          tags:
            - tag: component
              value: memory
          triggers:
            - uuid: ef9f92401e7442ec906779ed8a311d36
              expression: 'change(/OPNsense by HTTP-JSON/opns.mbuf.denied)>0'
              name: 'OPNsense: Kernel denied network memory requests'
              priority: HIGH
              description: 'The kernel ran out of mbufs or clusters and dropped traffic. Raise kern.ipc.nmbclusters. The counter never decreases, so this fires once per new occurrence.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: capacity
        - uuid: eed27adcc6d14ac886f846d31525fbbc
          name: 'OPNsense: mbuf statistics (raw)'
          type: HTTP_AGENT
          key: opns.mbuf.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Kernel network memory pool, the libxo output of netstat -m.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/interface/get_memory_statistics'
          tags:
            - tag: component
              value: raw
        - uuid: f8800baa079b46f485a049ee02d61b57
          name: 'ARC Memory'
          type: DEPENDENT
          key: opns.memory.arc
          delay: '0'
          history: 1d
          units: B
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.memory.arc
          master_item:
            key: opns.raw.memory.status
        - uuid: 552ff5f7fb0f49f0aa069311a22fe282
          name: 'Total Memory'
          type: DEPENDENT
          key: opns.memory.total
          delay: '0'
          history: 1d
          units: B
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.memory.total
          master_item:
            key: opns.raw.memory.status
        - uuid: 3b0ee64a3c204c22a6d10662db8569ca
          name: 'Used Memory'
          type: DEPENDENT
          key: opns.memory.used
          delay: '0'
          history: 1d
          units: B
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.memory.used
          master_item:
            key: opns.raw.memory.status
        - uuid: bc1340c5c93f49f09608f02a06cbbb14
          name: 'Memory utilization in %'
          type: CALCULATED
          key: opns.memory.util
          units: '%'
          params: 'last(//opns.memory.used)*100/last(//opns.memory.total)'
          tags:
            - tag: component
              value: memory
          triggers:
            - uuid: 9da4ebacfb764e0b9c5942ceb86cc62d
              expression: 'min(/OPNsense by HTTP-JSON/opns.memory.util,5m)>{$OPNS.MEMORY.UTIL.MAX}'
              name: 'Memory utilization is high'
              opdata: '{ITEM.LASTVALUE}'
              priority: AVERAGE
        - uuid: b73b209143d64fe1a51bc35e354bd41f
          name: 'netisr: Queue drops'
          type: DEPENDENT
          key: opns.netisr.queue.drops
          delay: '0'
          description: 'Packets discarded because a netisr queue was full, summed over all protocols and worker streams. This is the symptom of a firewall that cannot keep up with its offered load, and it is invisible in interface counters.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.netisr.workstream[*].work[*][''queue-drops''].sum()'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.netisr.raw
          tags:
            - tag: component
              value: network
          triggers:
            - uuid: 2230eaed50934fca8032cf7c4334929f
              expression: 'change(/OPNsense by HTTP-JSON/opns.netisr.queue.drops)>0'
              name: 'OPNsense: netisr queue is dropping packets'
              priority: AVERAGE
              description: 'The kernel discarded packets before they reached the firewall rules. Check load, interface queue lengths and net.isr tuning. The counter never decreases, so this fires once per new occurrence.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: capacity
        - uuid: 81e13419ac25457aae76832f18973b21
          name: 'OPNsense: netisr statistics (raw)'
          type: HTTP_AGENT
          key: opns.netisr.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Network dispatch queues, the libxo output of netstat -Q.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/interface/get_netisr_statistics'
          tags:
            - tag: component
              value: raw
        - uuid: f74d5a2f3e854b038f5ff20aa13956a2
          name: 'NTP: Offset of the selected peer'
          type: DEPENDENT
          key: opns.ntp.offset
          delay: '0'
          value_type: FLOAT
          units: ms
          description: 'How far the local clock sits from the peer it is currently steering by. A drifting firewall clock breaks IPsec, certificate validation and the correlation of its own logs, and it does so without any other symptom.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.rows[?(@.status == "*" || @.status == "o")].offset.first()'
            - type: LTRIM
              parameters:
                - +
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.ntp.raw
          tags:
            - tag: component
              value: system
          triggers:
            - uuid: 88a39044e34e42b79469d1271f033633
              expression: 'abs(last(/OPNsense by HTTP-JSON/opns.ntp.offset))>{$OPNS.NTP.OFFSET.WARN}'
              name: 'OPNsense: Clock offset is high'
              priority: WARNING
              description: 'The local clock has drifted away from its time source. Check reachability of the configured servers.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: 1d2232e131f94e308f3f27e2dc57e107
          name: 'NTP: Reachable peers'
          type: DEPENDENT
          key: opns.ntp.peers.reachable
          delay: '0'
          description: 'Configured time sources that have answered recently. Pool placeholders are excluded, they are not servers but slots the daemon still has to fill.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.rows[?(@.reach != "0")].length()'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.ntp.raw
          tags:
            - tag: component
              value: system
        - uuid: 78094f0d9d1d4e2daaad72d7068ebc1d
          name: 'OPNsense: NTP peers (raw)'
          type: HTTP_AGENT
          key: opns.ntp.raw
          delay: 5m
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Peer list of the time daemon with selection state, stratum, reach, offset and jitter.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/ntpd/service/status'
          tags:
            - tag: component
              value: raw
        - uuid: a8c6cbd180b14b88909e02a27d6db1e3
          name: 'NTP: Stratum of the selected peer'
          type: DEPENDENT
          key: opns.ntp.stratum
          delay: '0'
          description: 'Distance of the chosen source from a reference clock. A stratum of 16 means the daemon is not synchronised at all.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.rows[?(@.status == "*" || @.status == "o")].stratum.first()'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.ntp.raw
          tags:
            - tag: component
              value: system
        - uuid: 8e5588431dd347dbaf22b097235857d5
          name: 'NTP: Synchronised'
          type: DEPENDENT
          key: opns.ntp.synced
          delay: '0'
          description: 'Whether the daemon has settled on a time source. Unsynchronised is the state that matters: the clock then follows nothing and drifts freely.'
          valuemap:
            name: 'NTP sync state'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.rows[?(@.status == "*" || @.status == "o")].status.first()'
            - type: STR_REPLACE
              parameters:
                - '*'
                - '1'
            - type: STR_REPLACE
              parameters:
                - o
                - '1'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 15m
          master_item:
            key: opns.ntp.raw
          tags:
            - tag: component
              value: system
          triggers:
            - uuid: f3c6e34d75c94b6e9d22b716bdb5224d
              expression: 'min(/OPNsense by HTTP-JSON/opns.ntp.synced,30m)=0'
              name: 'OPNsense: Clock is not synchronised'
              priority: WARNING
              description: 'No time source has been selected for half an hour. Right after a boot this is normal for a few minutes, beyond that the configured servers are unreachable or refusing.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: f1912c86490242bead36dcc962738cc7
          name: 'OpenVPN: sessions (raw)'
          type: HTTP_AGENT
          key: opns.openvpn.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Every OpenVPN instance and every client connected to a server, in one request. Instances that are enabled but not running are included with an empty status, so a server that died is still discovered rather than disappearing.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.rows
          timeout: 15s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/openvpn/service/search_sessions'
          tags:
            - tag: component
              value: raw
        - uuid: 0218fd02165d499abf5b6e99899ac1f5
          name: 'pf: Bad offset packets per second'
          type: DEPENDENT
          key: opns.pf.counter.badoffset.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets whose header offset field was invalid. Normally zero for the whole uptime.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info.counters[''bad-offset''].rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 6cd8c6c52d4d40dfb77440f49bd8d012
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.counter.badoffset.rate)>0'
              name: 'OPNsense: pf is seeing malformed packets'
              priority: WARNING
              description: 'Packets with a bad offset are normally zero. A sustained rate points at a broken sender or an attack.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: security
        - uuid: 7a31f50e52f14e4699b7721de4bf6cde
          name: 'pf: Fragmented packets per second'
          type: DEPENDENT
          key: opns.pf.counter.fragment.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Fragmented packets seen by pf. Some fragmentation is normal, a rising rate usually means an MTU mismatch somewhere on the path.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.info.counters.fragment.rate
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 98c05249f1b946fba0946f29970e16b1
          name: 'pf: Rule matches per second'
          type: DEPENDENT
          key: opns.pf.counter.match.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets that matched a filter rule. The general throughput measure of the ruleset.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.info.counters.match.rate
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 0aea85a0efa849a6b3aadf3a3e271c77
          name: 'pf: Packets dropped for memory per second'
          type: DEPENDENT
          key: opns.pf.counter.memdrop.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets dropped because pf could not allocate memory for a state or a fragment. Traffic is lost when this is non zero.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.info.counters.memory.rate
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 1a515d1149fc456d9924e56117521b9e
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.counter.memdrop.rate)>0'
              name: 'OPNsense: pf is dropping packets due to memory'
              priority: HIGH
              description: 'pf ran out of memory for states or fragments. Traffic is being lost. Check the state and table limits.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: capacity
        - uuid: 6dac0fe927e746ebb3ea8416930e2403
          name: 'pf: Normalized packets per second'
          type: DEPENDENT
          key: opns.pf.counter.normalize.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets rewritten by scrub rules, most often reassembled fragments.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.info.counters.normalize.rate
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: caeb2c07455a4019be35e91c81d1c9c2
          name: 'pf: Short packets per second'
          type: DEPENDENT
          key: opns.pf.counter.short.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets shorter than their own header claimed. Normally zero, and malformed by definition.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.info.counters.short.rate
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 54f2082907fd45ac9bbefc55d3332e1e
          name: 'pf: Source limit hits per second'
          type: DEPENDENT
          key: opns.pf.counter.srclimit.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Connections refused because one source exceeded the number of states its rule allows it.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info.counters[''src-limit''].rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 6f99ebf6ed89485aabcc850cb4d92047
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.counter.srclimit.rate)>0'
              name: 'OPNsense: pf source limit is being hit'
              priority: WARNING
              description: 'A single source exceeded its allowed number of states.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: security
        - uuid: 875adf308ec14afeb8fa9cf6b65b442f
          name: 'pf: State limit hits per second'
          type: DEPENDENT
          key: opns.pf.counter.statelimit.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Connections refused because the state table is at its limit. Every one of these is a connection that did not happen.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info.counters[''state-limit''].rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 05bc928b25364783802c1ec3e6e565f6
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.counter.statelimit.rate)>0'
              name: 'OPNsense: pf state limit is being hit'
              priority: HIGH
              description: 'New connections are refused because the state limit is reached. Raise the limit or find the source.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: capacity
        - uuid: 7f915ddd699e49eeb910d9b0baefa1a1
          name: 'pf: State mismatches per second'
          type: DEPENDENT
          key: opns.pf.counter.statemismatch.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets that did not fit the state they were matched against. Isolated ones are normal on an asymmetric path, a sustained rate is not.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info.counters[''state-mismatch''].rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: c8b50233181d4c1e8035be31cb3ba920
          name: 'pf: Overload table insertions per second'
          type: DEPENDENT
          key: opns.pf.overload.rate
          delay: '0'
          value_type: FLOAT
          units: '!/s'
          description: 'Entries added to the overload table, where pf collects sources that tripped a connection rate limit. Rises during brute force attempts against an exposed service.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info[''limit-counters''][''overload-table-insertion''].rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 7a3ca88428de4570a885bc54681bc733
          name: 'pf: Rule evaluations per second'
          type: DEPENDENT
          key: opns.pf.rules.evaluations.rate
          delay: '0'
          value_type: FLOAT
          units: '!/s'
          description: 'How many rule tests pf performs per second across the whole ruleset. Rises with traffic and with ruleset length, and shows what a reordering or a large alias table costs. The counters reset when the ruleset is reloaded, which the rate calculation absorbs by discarding the decrease.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.evaluations
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.pf.rules.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 0eb191ed0e054f1a9acbec74f781322c
          name: 'pf: Filter rules loaded'
          type: DEPENDENT
          key: opns.pf.rules.filter.count
          delay: '0'
          description: 'Number of filter rules in the running ruleset. Counting instead of tracking the rules themselves keeps this to one item and survives a changing WAN address, which rewrites rule text without changing the rule count.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.filter
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.pf.rules.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 1ee1ad9ee1c14a4db7a4ee8f090db200
              expression: 'change(/OPNsense by HTTP-JSON/opns.pf.rules.filter.count)<>0 and last(/OPNsense by HTTP-JSON/opns.pf.rules.filter.count,#2)>0'
              name: 'OPNsense: Number of filter rules has changed'
              priority: INFO
              description: 'Rules were added or removed. Useful for correlating a fault with a change to the ruleset. Edits to an existing rule do not change the count and are not detected. The second condition suppresses the jump out of a zero, which is what an item reports after a gap in collection rather than a real change.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: b4f0d90c720d461b90951326bf53225a
          name: 'pf: Ruleset fingerprint'
          type: DEPENDENT
          key: opns.pf.rules.fingerprint
          delay: '0'
          value_type: CHAR
          trends: '0'
          description: 'Hash over the text of every filter and NAT rule, sorted so that reordering alone does not register. Catches what the rule counts cannot, namely an edit to an existing rule, which leaves the number of rules untouched. Counters are excluded from the hash, otherwise it would change with every packet. On a firewall whose WAN address changes, expect this to move with it. Rules written against an interface keep a symbolic form such as (vtnet0:1), but the generated anti-spoofing rules and every route-to statement embed the address literally; on the firewall this was measured against, 22 of 176 rules did so. The trigger is INFO for that reason, and a changed address is in fairness a changed ruleset.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.fingerprint
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.pf.rules.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: b2f22276435647e2927cbd559f287a69
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.rules.fingerprint,#1)<>last(/OPNsense by HTTP-JSON/opns.pf.rules.fingerprint,#2)'
              name: 'OPNsense: Ruleset has changed'
              priority: INFO
              description: 'A rule was added, removed, edited or reworded. Together with the rule counts this separates the cases: if the counts moved as well, rules were added or removed, if they did not, an existing rule was edited.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: f415a763d5e744f1aa3485e557dd758a
          name: 'pf: NAT rules loaded'
          type: DEPENDENT
          key: opns.pf.rules.nat.count
          delay: '0'
          description: 'Number of NAT rules in the running ruleset. Changes when the configuration is applied, so it works as a change signal.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.nat
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.pf.rules.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 3b0f62f374d746e08ae644b469cd0850
              expression: 'change(/OPNsense by HTTP-JSON/opns.pf.rules.nat.count)<>0 and last(/OPNsense by HTTP-JSON/opns.pf.rules.nat.count,#2)>0'
              name: 'OPNsense: Number of NAT rules has changed'
              priority: INFO
              description: 'NAT rules were added or removed. Edits to an existing rule leave the count unchanged and are not detected. The second condition suppresses the jump out of a zero, which is what an item reports after a gap in collection rather than a real change.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: 90672665713e4ca0bdf6314f72802c30
          name: 'OPNsense: pf ruleset (raw)'
          type: HTTP_AGENT
          key: opns.pf.rules.raw
          delay: 10m
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Running filter and NAT ruleset with per rule counters. Polled every ten minutes because the response carries the full text of every rule and rule changes are not a per minute concern.'
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  // The ruleset response is around 50 kB and keyed by the rule text itself. Counting and
                  // hashing it once here keeps five items off that payload.
                  var rules = JSON.parse(value).rules || {};
                  var filter = rules['filter rules'] || {};
                  var nat = rules['nat rules'] || {};
                  var names = Object.keys(filter), unused = 0, evaluations = 0;
                  for (var i = 0; i < names.length; i++) {
                      var r = filter[names[i]];
                      evaluations += Number(r.evaluations) || 0;
                      if ((Number(r.evaluations) || 0) === 0) { unused++; }
                  }
                  // order independent checksum over the rule texts, so a reordered ruleset still reads as a
                  // change while an unchanged one keeps its fingerprint
                  var h = 0;
                  for (var j = 0; j < names.length; j++) {
                      var s = names[j], k = 0;
                      for (var c = 0; c < s.length; c++) { k = (k * 31 + s.charCodeAt(c)) & 0xffffffff; }
                      h = (h ^ k) >>> 0;
                  }
                  return JSON.stringify({
                      filter: names.length,
                      nat: Object.keys(nat).length,
                      unused: unused,
                      evaluations: evaluations,
                      fingerprint: h.toString(16)
                  });
          timeout: 30s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/firewall/pf_statistics/rules'
          tags:
            - tag: component
              value: raw
        - uuid: 8273140fad6d43dd9d310e87a36c72c7
          name: 'pf: Rules never matched'
          type: DEPENDENT
          key: opns.pf.rules.unused
          delay: '0'
          description: 'Rules with no evaluation since the ruleset was last loaded. Useful for spotting rules that no longer do anything, but only meaningful after a decent uptime: a reload resets every counter, so right after a configuration change this equals the total rule count. Deliberately has no trigger for that reason.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.unused
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.pf.rules.raw
          tags:
            - tag: component
              value: firewall
        - uuid: a6e688223c01428b80af1979f113d7ca
          name: 'pf: Source nodes'
          type: DEPENDENT
          key: opns.pf.srcnodes.current
          delay: '0'
          description: 'Source tracking entries in use. One per client for rules using sticky-address or a source limit, so this grows with the number of distinct clients rather than with connections.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info[''source-tracking-table''][''current-entries''].total'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 27278e260c154ead931b03575539fbe3
          name: 'pf: Source node limit'
          type: DEPENDENT
          key: opns.pf.srcnodes.limit
          delay: '0'
          description: 'Maximum number of source tracking entries pf will hold.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.memory[''src-nodes'']'
              error_handler: DISCARD_VALUE
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.pfmem.raw
          tags:
            - tag: component
              value: firewall
        - uuid: b96d3a62d4ff45b588a98b01adf934a4
          name: 'pf: Source tracking table utilization'
          type: CALCULATED
          key: opns.pf.srcnodes.pused
          value_type: FLOAT
          units: '%'
          params: 'last(/{HOST.HOST}/opns.pf.srcnodes.current) / last(/{HOST.HOST}/opns.pf.srcnodes.limit) * 100'
          description: 'Source tracking holds one entry per client for rules using sticky-address or source limits. Exhausting it rejects new connections from new clients while the state table still looks healthy.'
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: d98d27aa13ad4208923e7ac5b171af2c
              expression: 'min(/OPNsense by HTTP-JSON/opns.pf.srcnodes.pused,5m)>{$OPNS.PF.SRCNODES.UTIL.CRIT}'
              name: 'OPNsense: pf source tracking table is filling up'
              priority: HIGH
              description: 'Once the limit is reached pf refuses connections from clients it has no entry for.'
              manual_close: 'YES'
              dependencies:
                - name: 'OPNsense: pf source limit is being hit'
                  expression: 'last(/OPNsense by HTTP-JSON/opns.pf.counter.srclimit.rate)>0'
              tags:
                - tag: scope
                  value: capacity
        - uuid: a2687fd90bd14a8cb576be6a418b0aea
          name: 'pf: State table inserts per second'
          type: DEPENDENT
          key: opns.pf.states.inserts.rate
          delay: '0'
          value_type: FLOAT
          units: '!/s'
          description: 'New connections entering the state table per second.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info[''state-table''].inserts.rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 4d837e1563fe49e3b5a2c278fdb363af
          name: 'pf: State table removals per second'
          type: DEPENDENT
          key: opns.pf.states.removals.rate
          delay: '0'
          value_type: FLOAT
          units: '!/s'
          description: 'Connections leaving the state table per second, through closure or timeout. Should roughly track the insert rate in steady state.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info[''state-table''].removals.rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 019b949115ed41f2b6353708665bd66a
          name: 'pf: State table searches per second'
          type: DEPENDENT
          key: opns.pf.states.searches.rate
          delay: '0'
          value_type: FLOAT
          units: '!/s'
          description: 'State table lookups per second, one or more per forwarded packet. The busiest counter on a loaded firewall.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info[''state-table''].searches.rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
        - uuid: a0e90b695439402eab430202d6f1b19b
          name: 'pf: SYN floods detected per second'
          type: DEPENDENT
          key: opns.pf.synfloods.rate
          delay: '0'
          value_type: FLOAT
          units: '!/s'
          description: 'Destinations for which pf switched to syncookies because half open connections piled up.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.info[''limit-counters''][''synfloods-detected''].rate'
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.pfinfo.raw
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 34fc6db0b7a848269639584ed8dc8ef6
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.synfloods.rate)>0'
              name: 'OPNsense: SYN flood detected'
              priority: AVERAGE
              description: 'pf activated syncookies for at least one destination.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: security
        - uuid: eb159589dbf540dbbd99286114da7408
          name: 'pf: Table entry limit'
          type: DEPENDENT
          key: opns.pf.tables.entries.limit
          delay: '0'
          description: 'Ceiling for all pf table entries combined, from the firewall maximum table entries setting.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.size
              error_handler: DISCARD_VALUE
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 6h
          master_item:
            key: opns.alias.raw
          tags:
            - tag: component
              value: firewall
        - uuid: a20a35f8a0404b0c9ca510aff2375483
          name: 'pf: Table entry utilization'
          type: CALCULATED
          key: opns.pf.tables.entries.pused
          delay: 10m
          value_type: FLOAT
          units: '%'
          params: 'last(/{HOST.HOST}/opns.pf.tables.entries.used) / last(/{HOST.HOST}/opns.pf.tables.entries.limit) * 100'
          description: 'How much of the table entry budget the aliases consume. Exceeding it is not a slow degradation: pf refuses to load a ruleset whose tables do not fit, so the firewall keeps running on the previous one and quietly ignores the change that was just applied.'
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 9435c068315a403ea3671bad9d3e6292
              expression: 'last(/OPNsense by HTTP-JSON/opns.pf.tables.entries.pused)>{$OPNS.PF.TABLES.UTIL.WARN}'
              name: 'OPNsense: pf table entries are filling up'
              priority: WARNING
              description: 'Raise the maximum table entries setting before a block list update pushes the ruleset over the limit.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: capacity
        - uuid: 78620dcdf6724d7996c68358691bd45b
          name: 'pf: Table entries in use'
          type: DEPENDENT
          key: opns.pf.tables.entries.used
          delay: '0'
          description: 'Addresses currently held across all pf tables, which is what aliases, block lists and GeoIP feeds fill.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.used
              error_handler: DISCARD_VALUE
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.alias.raw
          tags:
            - tag: component
              value: firewall
        - uuid: 05804e7b88c34073b59b7b0d95792b3d
          name: 'OPNsense: pf statistics (raw)'
          type: HTTP_AGENT
          key: opns.pfinfo.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Full pfctl -si output: state table, source tracking, counters and limit counters. Rates are already computed by pf.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/firewall/pf_statistics/info'
          tags:
            - tag: component
              value: raw
        - uuid: 95e499166a0b4f4593c2b405422388b1
          name: 'OPNsense: pf limits (raw)'
          type: HTTP_AGENT
          key: opns.pfmem.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Hard limits for states, source nodes, fragments and table entries. These change only with the configuration, but are polled at the same interval as the counters they are compared against: a calculated item goes unsupported while a referenced item has no data yet, so a slower interval here would leave the source tracking utilisation unsupported after every template link.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/firewall/pf_statistics/memory'
          tags:
            - tag: component
              value: raw
        - uuid: 90c1c7dd19ed45038ec9281727d8a32b
          name: 'Licensed until'
          type: DEPENDENT
          key: opns.product.licenseuntil
          delay: '0'
          trends: '0'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.product.product_license.valid_to
              error_handler: CUSTOM_VALUE
              error_handler_params: '0'
            - type: JAVASCRIPT
              parameters:
                - |
                  function convertDateToUnixTimestamp(input) {
                      if (input === '0' || input === '' || input === null) {
                          return 0;
                      }
                      const date = new Date(input);
                      const unixTimestamp = Math.floor(date.getTime() / 1000);
                      if (isNaN(unixTimestamp)) {
                          return 0;
                      }
                      return unixTimestamp;
                  }
                  
                  return convertDateToUnixTimestamp(value);
          master_item:
            key: opns.raw.product.info
          triggers:
            - uuid: 740c029a6e7a49cb8eedc53e759eb6bb
              expression: 'last(/OPNsense by HTTP-JSON/opns.product.licenseuntil)>0 and (last(/OPNsense by HTTP-JSON/opns.product.licenseuntil) - now()) / 86400 < {$OPNS.LICENSE.EXPIRY.WARN}'
              name: 'OPNSense Business License expires soon'
              event_name: 'OPNSense Business License expires soon (less than {$OPNS.LICENSE.EXPIRY.WARN} days)'
              priority: AVERAGE
        - uuid: 0ab125b2bf4c4fb48daa9c292f17c325
          name: 'IP: Packets with a bad checksum per second'
          type: DEPENDENT
          key: opns.proto.ip.badsum.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'IP packets discarded because the header checksum did not match. Steady non zero values point at a hardware or cabling fault rather than at an attack.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.statistics.ip[''dropped-bad-checksum'']'
              error_handler: DISCARD_VALUE
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.proto.raw
          tags:
            - tag: component
              value: network
          triggers:
            - uuid: dfb2ce1a8a9c4e21aeeb47d403aaf82e
              expression: 'min(/OPNsense by HTTP-JSON/opns.proto.ip.badsum.rate,10m)>0'
              name: 'OPNsense: Receiving IP packets with bad checksums'
              priority: WARNING
              description: 'A sustained rate points at faulty cabling, a failing NIC or a broken device upstream. Occasional single packets are normal.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: hardware
        - uuid: 1aae2d8e04df4f1d9ef08ef4f10c47b3
          name: 'IP: Fragments dropped per second'
          type: DEPENDENT
          key: opns.proto.ip.fragdrop.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Fragments the kernel could not reassemble. Typically an MTU problem, often on a tunnel.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.statistics.ip[''dropped-fragments'']'
              error_handler: DISCARD_VALUE
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.proto.raw
          tags:
            - tag: component
              value: network
        - uuid: d238947328814fa196cce03cae78b43d
          name: 'IP: Packets that cannot be forwarded per second'
          type: DEPENDENT
          key: opns.proto.ip.nofwd.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets the firewall was asked to route onward but could not, for instance because forwarding is disabled for that address family.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.statistics.ip[''packets-cannot-forward'']'
              error_handler: DISCARD_VALUE
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.proto.raw
          tags:
            - tag: component
              value: network
        - uuid: b8667f2aeff84bf8b07bf7f97db72d54
          name: 'IP: Packets discarded for lack of a route per second'
          type: DEPENDENT
          key: opns.proto.ip.noroute.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Packets discarded because no route matched their destination. Rises when a gateway or a tunnel disappears while traffic for it keeps arriving.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.statistics.ip[''discard-no-route'']'
              error_handler: DISCARD_VALUE
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.proto.raw
          tags:
            - tag: component
              value: network
          triggers:
            - uuid: c106d7fc780e4a93afc2a37554f88647
              expression: 'min(/OPNsense by HTTP-JSON/opns.proto.ip.noroute.rate,10m)>0'
              name: 'OPNsense: Packets discarded for lack of a route'
              priority: WARNING
              description: 'Traffic arrives for destinations the firewall has no route to. Check the routing table and whether a gateway or a tunnel went down.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: availability
        - uuid: 3978662cacf44682b137cafc1cb65d61
          name: 'OPNsense: Protocol statistics (raw)'
          type: HTTP_AGENT
          key: opns.proto.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Per protocol kernel counters, the libxo output of netstat -s.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/interface/get_protocol_statistics'
          tags:
            - tag: component
              value: raw
        - uuid: a35171eb11de44b3af5a5d3495e835d1
          name: 'TCP: Segments with a bad checksum per second'
          type: DEPENDENT
          key: opns.proto.tcp.badsum.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'TCP segments discarded on a checksum mismatch, counted separately from the IP layer.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.statistics.tcp[''discard-bad-checksum'']'
              error_handler: DISCARD_VALUE
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.proto.raw
          tags:
            - tag: component
              value: network
        - uuid: c84404e894544ebc92dcb274cab497e9
          name: 'TCP: Retransmitted segments per second'
          type: DEPENDENT
          key: opns.proto.tcp.retrans.rate
          delay: '0'
          value_type: FLOAT
          units: '!p/s'
          description: 'Retransmissions sent by the firewall itself, so this reflects the quality of its own connections rather than of forwarded traffic.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.statistics.tcp[''sent-retransmitted-packets'']'
              error_handler: DISCARD_VALUE
            - type: CHANGE_PER_SECOND
              parameters:
                - ''
          master_item:
            key: opns.proto.raw
          tags:
            - tag: component
              value: network
        - uuid: 164f961df24a445aa57872068e5a1f99
          name: 'RAW Disk'
          type: HTTP_AGENT
          key: opns.raw.disk
          delay: 5m
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  var raw = value;
                  var data;
                  
                  try {
                      data = JSON.parse(raw);
                  } catch(e) {
                      throw 'JSON parse error: ' + e + ' | raw value: ' + raw;
                  }
                  
                  if (!data || typeof data.devices === 'undefined') {
                      throw 'No devices key found. Data: ' + JSON.stringify(data);
                  }
                  
                  function toBytes(str) {
                      if (!str || str === '-') return 0;
                  
                      var units = {
                          'K': 1024,
                          'M': 1024 * 1024,
                          'G': 1024 * 1024 * 1024,
                          'T': 1024 * 1024 * 1024 * 1024
                      };
                  
                      var s = String(str).trim();
                      var lastChar = s.charAt(s.length - 1).toUpperCase();
                  
                      if (units[lastChar]) {
                          var num = parseFloat(s.slice(0, -1));
                          return Math.round(num * units[lastChar]);
                      }
                  
                      return Math.round(parseFloat(s));
                  }
                  
                  for (var i = 0; i < data.devices.length; i++) {
                      var d = data.devices[i];
                      d.blocks    = toBytes(d.blocks);
                      d.used      = toBytes(d.used);
                      d.available = toBytes(d.available);
                  }
                  
                  return JSON.stringify(data);
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/system/system_disk'
          tags:
            - tag: component
              value: raw
        - uuid: d50283b96ba64d769fbd744e9a71f327
          name: 'RAW Firmware Status'
          type: HTTP_AGENT
          key: opns.raw.firmware.status
          delay: 1d
          history: 7d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/core/firmware/status'
          request_method: POST
          tags:
            - tag: component
              value: raw
        - uuid: b8a1ea18da234409af64be5edef3115a
          name: 'RAW Firewallaction'
          type: HTTP_AGENT
          key: opns.raw.fw.action
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/firewall/stats?group_by=action'
          tags:
            - tag: component
              value: raw
        - uuid: 4f89efb7b9014c209f585e153f557f7e
          name: 'RAW Firewall Interfaces'
          type: HTTP_AGENT
          key: opns.raw.fw.interface.stat
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/firewall/pf_statistics/interfaces'
          tags:
            - tag: component
              value: raw
        - uuid: d15b7b8cdec9486a97450b16166eaf81
          name: 'RAW Firewall States'
          type: HTTP_AGENT
          key: opns.raw.fw.states
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/firewall/pf_states'
          tags:
            - tag: component
              value: raw
        - uuid: 984a9170893d488f8c3140b9d3a5c7c2
          name: 'RAW Gatewaystatus'
          type: HTTP_AGENT
          key: opns.raw.gateway.status
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.items
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/routes/gateway/status'
          tags:
            - tag: component
              value: raw
          triggers:
            - uuid: 20ff02c55d314364964f900d1f4ca0f3
              expression: 'nodata(/OPNsense by HTTP-JSON/opns.raw.gateway.status,5m)=1'
              name: 'No data from OPNsense'
              priority: HIGH
              description: 'can''t access the OPNsense API'
        - uuid: 533374a5ae2e48168a900807da13b335
          name: 'RAW Carp Interfaces'
          type: HTTP_AGENT
          key: opns.raw.interfaces.carp
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/interface/get_vip_status'
          tags:
            - tag: component
              value: raw
        - uuid: 69e94d002b4149e2b9fe418a1186c7d5
          name: 'RAW Interfaces'
          type: HTTP_AGENT
          key: opns.raw.interfaces.stat
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.interfaces
            - type: JSONPATH
              parameters:
                - '$.*'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/traffic/_interface'
          tags:
            - tag: component
              value: raw
        - uuid: eaa9d3bfec0d45b79d79452f33c04b2d
          name: 'RAW Load'
          type: HTTP_AGENT
          key: opns.raw.load
          delay: 5m
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/system/system_time'
          tags:
            - tag: component
              value: raw
        - uuid: 9a4ce32c699b4fbcb0263d964186c8aa
          name: 'RAW Memorystatus'
          type: HTTP_AGENT
          key: opns.raw.memory.status
          delay: 5m
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/system/system_resources'
          tags:
            - tag: component
              value: raw
        - uuid: feadfb993c31464aba5fa96a31033cb8
          name: 'RAW Product Info'
          type: HTTP_AGENT
          key: opns.raw.product.info
          delay: 30m
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/core/firmware/info'
          tags:
            - tag: component
              value: raw
        - uuid: d9a4a8fb12614491a950e51d48e250cf
          name: 'OPNsense: Services (raw)'
          type: HTTP_AGENT
          key: opns.services.raw
          delay: 5m
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Run state of every service the firewall knows about, including the packet filter itself.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/core/service/search'
          tags:
            - tag: component
              value: raw
        - uuid: 2bc82e7f22a3476396ce1731aee50d8f
          name: 'States table utilization in %'
          type: CALCULATED
          key: opns.states.util
          history: 30d
          value_type: FLOAT
          units: '%'
          params: 'last(//opns.fw.states.current)*100/last(//opns.fw.states.max)'
          tags:
            - tag: component
              value: firewall
          triggers:
            - uuid: 7421fd082b4a4fb0b5e57d20475b310f
              expression: 'min(/OPNsense by HTTP-JSON/opns.states.util,#3)>{$OPNS.STATE.TABLE.UTIL.MAX}'
              name: 'State table usage is high'
              event_name: 'State table usage more than {$OPNS.STATE.TABLE.UTIL.MAX}.'
              opdata: 'Current utilization: {ITEM.LASTVALUE}'
              priority: WARNING
              description: 'Please check the number of connections.'
        - uuid: cc8537683e82411996fb870aee598ab3
          name: 'OPNsense: Swap (raw)'
          type: HTTP_AGENT
          key: opns.swap.raw
          delay: 5m
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Swap devices with total and used, in KB. The list is empty on installations without swap, which is why the items below are discovered rather than static.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/system/system_swap'
          tags:
            - tag: component
              value: raw
        - uuid: bba0f16cd80e4ef3beab48225587d2eb
          name: 'Load average (5 min)'
          type: DEPENDENT
          key: opns.system.load.avg5
          delay: '0'
          value_type: FLOAT
          description: 'Run queue length averaged over five minutes. The value to alert on, since it ignores brief spikes.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.loadavg
            - type: REGEX
              parameters:
                - '^[^,]*,\s*([0-9.]+)'
                - \1
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 5m
          master_item:
            key: opns.raw.load
          tags:
            - tag: component
              value: cpu
          triggers:
            - uuid: e6992d36c4a941d1af7f1ad42fd8b8c8
              expression: 'avg(/OPNsense by HTTP-JSON/opns.system.load.avg5,10m)>{$OPNS.LOAD.AVG5.WARN}'
              name: 'OPNsense: Load average is high'
              priority: WARNING
              description: 'The 5 minute average has been above the threshold for 10 minutes.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: performance
        - uuid: 385bf4dc75f947699128ba4e0166bb08
          name: 'Load average (15 min)'
          type: DEPENDENT
          key: opns.system.load.avg15
          delay: '0'
          value_type: FLOAT
          description: 'Run queue length averaged over fifteen minutes. Shows whether a load is sustained or passing.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.loadavg
            - type: REGEX
              parameters:
                - '^[^,]*,[^,]*,\s*([0-9.]+)'
                - \1
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.raw.load
          tags:
            - tag: component
              value: cpu
        - uuid: 6d3501d8f07c4c93b707e2a7dc804fc4
          name: 'Load average per core (5 min)'
          type: CALCULATED
          key: opns.system.load.percore
          value_type: FLOAT
          params: 'last(/{HOST.HOST}/opns.system.load.avg5) / last(/{HOST.HOST}/opns.cpu.cores)'
          description: 'Five minute load divided by the number of cores. A load of 4 means saturation on a two core appliance and idling on a sixteen core one, so this is the figure that is comparable between firewalls. The API offers no true CPU utilisation, which makes this the closest available measure of saturation.'
          tags:
            - tag: component
              value: cpu
          triggers:
            - uuid: 6023f2040d7245c892208b79ae0a9482
              expression: 'avg(/OPNsense by HTTP-JSON/opns.system.load.percore,15m)>{$OPNS.LOAD.PERCORE.WARN}'
              name: 'OPNsense: Load per core is high'
              priority: WARNING
              description: 'Sustained demand above what the cores can serve. Unlike the raw load average this does not need a per host threshold.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: performance
        - uuid: f58b046d6e554f129272472d79f00389
          name: 'System Uptime'
          type: DEPENDENT
          key: opns.system.uptime
          delay: '0'
          history: 1d
          value_type: FLOAT
          units: uptime
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.uptime
            - type: JAVASCRIPT
              parameters:
                - |
                  var str = value.trim();
                            var days = 0;
                            var hours = 0;
                            var minutes = 0;
                            var seconds = 0;
                  
                            // Extract days if present
                            var dayMatch = str.match(/(\d+)\s*days?/);
                            if (dayMatch) {
                                days = parseInt(dayMatch[1]);
                            }
                  
                            // Extract HH:MM:SS
                            var timeMatch = str.match(/(\d{1,2}):(\d{2}):(\d{2})/);
                            if (timeMatch) {
                                hours = parseInt(timeMatch[1]);
                                minutes = parseInt(timeMatch[2]);
                                seconds = parseInt(timeMatch[3]);
                            }
                  
                            return (days * 86400) + (hours * 3600) + (minutes * 60) + seconds;
          master_item:
            key: opns.raw.load
          triggers:
            - uuid: 2bf11a893917405195b8aef0620f4a30
              expression: 'last(/OPNsense by HTTP-JSON/opns.system.uptime)<600'
              name: '{HOST.NAME} has been restarted'
              priority: INFO
        - uuid: 73f1cb61be4b495399b288759bac40d4
          name: 'OPNsense: Temperature sensors (raw)'
          type: HTTP_AGENT
          key: opns.temperature.raw
          history: '0'
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          description: 'Sensor readings as a JSON array. Hardware without sensors, notably virtual machines, returns an empty array, so nothing is discovered and no item goes unsupported.'
          timeout: 10s
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/diagnostics/system/system_temperature'
          tags:
            - tag: component
              value: raw
        - uuid: 4dee0747d2ef4530999ae8535d8aba49
          name: 'RAW UPS'
          type: HTTP_AGENT
          key: opns.ups.raw
          delay: 5m
          history: 1d
          value_type: TEXT
          trends: '0'
          status: DISABLED
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  var data = JSON.parse(value);
                  var raw = data.response || "";
                  var result = {};
                  var lines = raw.split("\n");
                  
                  for (var i = 0; i < lines.length; i++) {
                      var line = lines[i].trim();
                      var idx = line.indexOf(": ");
                      if (idx > -1) {
                          var key = line.substring(0, idx).trim();
                          var val = line.substring(idx + 2).trim();
                          result[key] = val;
                      }
                  }
                  return JSON.stringify(result);
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/nut/diagnostics/upsstatus'
          tags:
            - tag: component
              value: raw
        - uuid: 4bfb793d3f9541948f4c33596ec7b342
          name: 'OPNsense: Version'
          type: DEPENDENT
          key: opns.version
          delay: '0'
          value_type: CHAR
          trends: '0'
          description: 'Product name, version and architecture as one string. Changes after an update was applied.'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.product_version
            - type: DISCARD_UNCHANGED_HEARTBEAT
              parameters:
                - 1h
          master_item:
            key: opns.raw.product.info
          tags:
            - tag: component
              value: system
          triggers:
            - uuid: e0c334276db040fc87e3b908ad71582d
              expression: 'last(/OPNsense by HTTP-JSON/opns.version,#1)<>last(/OPNsense by HTTP-JSON/opns.version,#2)'
              name: 'OPNsense: Version has changed'
              priority: INFO
              description: 'An update was most likely applied.'
              manual_close: 'YES'
              tags:
                - tag: scope
                  value: notice
        - uuid: 7945ce5b7e174b9e8f6ea6da6dd64060
          name: 'RAW WireGuard'
          type: HTTP_AGENT
          key: opns.wireguard.raw
          history: 1d
          value_type: TEXT
          trends: '0'
          authtype: BASIC
          username: '{$OPNS.KEY}'
          password: '{$OPNS.SECRET}'
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.rows
          url: 'https://{HOST.IP}:{$OPNS.PORT}/api/wireguard/service/show'
          tags:
            - tag: component
              value: raw
      discovery_rules:
        - uuid: 42db664817fa4d23803fe5be9eb4e0a1
          name: 'Disk Discovery'
          type: DEPENDENT
          key: opns.disk.discovery
          delay: '0'
          filter:
            conditions:
              - macro: '{#FSNAME}'
                value: '{$OPNS.FS.FSNAME.MATCHES}'
                formulaid: A
              - macro: '{#FSNAME}'
                value: '{$OPNS.FS.FSNAME.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: B
              - macro: '{#FSTYPE}'
                value: '{$OPNS.FS.FSTYPE.MATCHES}'
                formulaid: C
              - macro: '{#FSTYPE}'
                value: '{$OPNS.FS.FSTYPE.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: D
          lifetime: 1h
          item_prototypes:
            - uuid: 11fb9d381cda40c69274a77ae38679df
              name: 'FS [{#FSNAME}]: Get data'
              type: DEPENDENT
              key: 'opns.disk.data[{#FSNAME},data]'
              delay: '0'
              history: 1h
              value_type: TEXT
              trends: '0'
              description: 'Intermediate data of `{#FSNAME}` filesystem.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.devices.[?(@.mountpoint==''{#FSNAME}'')].first()'
              master_item:
                key: opns.raw.disk
              tags:
                - tag: component
                  value: raw
                - tag: component
                  value: storage
                - tag: filesystem
                  value: '{#FSNAME}'
                - tag: fstype
                  value: '{#FSTYPE}'
            - uuid: 31572a0b06d845d0809c7e6334aceb4d
              name: 'FS [{#FSNAME}]: Space: Available'
              type: DEPENDENT
              key: 'opns.disk.size[{#FSNAME},available]'
              delay: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - $.available
              master_item:
                key: 'opns.disk.data[{#FSNAME},data]'
              tags:
                - tag: component
                  value: storage
                - tag: filesystem
                  value: '{#FSNAME}'
                - tag: fstype
                  value: '{#FSTYPE}'
            - uuid: 57842e2439b244b0abe52b55a4920fc8
              name: 'FS [{#FSNAME}]: Space: Used, in %'
              type: DEPENDENT
              key: 'opns.disk.size[{#FSNAME},pused]'
              delay: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - $.used_pct
              master_item:
                key: 'opns.disk.data[{#FSNAME},data]'
              tags:
                - tag: component
                  value: storage
                - tag: filesystem
                  value: '{#FSNAME}'
                - tag: fstype
                  value: '{#FSTYPE}'
              trigger_prototypes:
                - uuid: 6029c2a1738244c2b8a46e89a11a1c54
                  expression: 'min(/OPNsense by HTTP-JSON/opns.disk.size[{#FSNAME},pused],5m)>{$OPNS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}'
                  name: 'OPNsense: FS [{#FSNAME}]: Space is critically low'
                  event_name: 'OPNsense: FS [{#FSNAME}]: Space is critically low (used > {$OPNS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}%, total {{?last(//opns.disk.size[{#FSNAME},total])/1024/1024/1024}.fmtnum(1)}GB)'
                  opdata: 'Space used: {{ITEM.LASTVALUE1}.fmtnum(1)}%'
                  priority: AVERAGE
                  description: |
                    The volume's space usage exceeds the `{$OPNS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}%` limit.
                    The trigger expression is based on the current used and maximum available spaces.
                    Event name represents the total volume space, which can differ from the maximum available space, depending on the filesystem type.
                  manual_close: 'YES'
                  tags:
                    - tag: scope
                      value: availability
                    - tag: scope
                      value: capacity
                - uuid: 1b4b75bad3344636aed077e9b8cced25
                  expression: 'min(/OPNsense by HTTP-JSON/opns.disk.size[{#FSNAME},pused],5m)>{$OPNS.FS.PUSED.MAX.WARN:"{#FSNAME}"}'
                  name: 'OPNsense: FS [{#FSNAME}]: Space is low'
                  event_name: 'OPNsense: FS [{#FSNAME}]: Space is low (used > {$OPNS.FS.PUSED.MAX.WARN:"{#FSNAME}"}%, total {{?last(//opns.disk.size[{#FSNAME},total])/1024/1024/1024}.fmtnum(1)}GB)'
                  opdata: 'Space used: {{ITEM.LASTVALUE1}.fmtnum(1)}%'
                  priority: WARNING
                  description: |
                    The volume's space usage exceeds the `{$OPNS.FS.PUSED.MAX.WARN:"{#FSNAME}"}%` limit.
                    The trigger expression is based on the current used and maximum available spaces.
                    Event name represents the total volume space, which can differ from the maximum available space, depending on the filesystem type.
                  dependencies:
                    - name: 'OPNsense: FS [{#FSNAME}]: Space is critically low'
                      expression: 'min(/OPNsense by HTTP-JSON/opns.disk.size[{#FSNAME},pused],5m)>{$OPNS.FS.PUSED.MAX.CRIT:"{#FSNAME}"}'
                  tags:
                    - tag: scope
                      value: availability
                    - tag: scope
                      value: capacity
            - uuid: a87f1fa2cd0c46fb9c6fad7abdaa2384
              name: 'FS [{#FSNAME}]: Space: Total'
              type: DEPENDENT
              key: 'opns.disk.size[{#FSNAME},total]'
              delay: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - $.blocks
              master_item:
                key: 'opns.disk.data[{#FSNAME},data]'
              tags:
                - tag: component
                  value: storage
                - tag: filesystem
                  value: '{#FSNAME}'
                - tag: fstype
                  value: '{#FSTYPE}'
            - uuid: 0220a78e2e444223a2a0b7ce0c01d24b
              name: 'FS [{#FSNAME}]: Space: Used'
              type: DEPENDENT
              key: 'opns.disk.size[{#FSNAME},used]'
              delay: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - $.used
              master_item:
                key: 'opns.disk.data[{#FSNAME},data]'
              tags:
                - tag: component
                  value: storage
                - tag: filesystem
                  value: '{#FSNAME}'
                - tag: fstype
                  value: '{#FSTYPE}'
          master_item:
            key: opns.raw.disk
          lld_macro_paths:
            - lld_macro: '{#FSNAME}'
              path: $.mountpoint
            - lld_macro: '{#FSTYPE}'
              path: $.type
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.devices
        - uuid: d4546fdb4b074d3680dff4aa23d2e70d
          name: 'FW Action Discovery'
          type: DEPENDENT
          key: opns.fw.action.discovery
          delay: '0'
          lifetime: 1h
          item_prototypes:
            - uuid: 3d794da1ea9448158f5786bf264ad1a3
              name: 'Firewall action {#FWACTION}'
              type: DEPENDENT
              key: 'opns.fw.action[{#FWACTION}]'
              delay: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["label"] == "{#FWACTION}")].value.first()'
              master_item:
                key: opns.raw.fw.action
              tags:
                - tag: component
                  value: firewall
          graph_prototypes:
            - uuid: d7df4ec348b345baa3828e2f9cc46539
              name: 'OPNSense Action Graph  {#FWACTION}'
              graph_items:
                - color: 199C0D
                  calc_fnc: MIN
                  item:
                    host: 'OPNsense by HTTP-JSON'
                    key: 'opns.fw.action[{#FWACTION}]'
          master_item:
            key: opns.raw.fw.action
          lld_macro_paths:
            - lld_macro: '{#FWACTION}'
              path: $.label
        - uuid: d1054089e01e4f9ea8db7b2f8e7cc526
          name: 'Gateway Discovery'
          type: DEPENDENT
          key: opns.gateway.discovery
          delay: '0'
          lifetime: 1h
          item_prototypes:
            - uuid: 2d01c25c7c2845858b675aa10a7b3f98
              name: 'Gateway Address {#GWSTATUSNAME}'
              type: DEPENDENT
              key: 'opns.gw.status.address[{#GWSTATUSNAME}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#GWSTATUSNAME}")].address.first()'
              master_item:
                key: opns.raw.gateway.status
              tags:
                - tag: Gateway
                  value: '{#GWSTATUSNAME}'
            - uuid: 3c3db192514349eda002215f553735db
              name: 'Gateway RTT {#GWSTATUSNAME}'
              type: DEPENDENT
              key: 'opns.gw.status.delay[{#GWSTATUSNAME}]'
              delay: '0'
              value_type: FLOAT
              units: ms
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#GWSTATUSNAME}")].delay.first()'
                - type: NOT_MATCHES_REGEX
                  parameters:
                    - \~
                  error_handler: CUSTOM_VALUE
                  error_handler_params: '9999'
                - type: RTRIM
                  parameters:
                    - ms
              master_item:
                key: opns.raw.gateway.status
              tags:
                - tag: Gateway
                  value: '{#GWSTATUSNAME}'
            - uuid: 0508664d600d48ababd8b8d1481e5191
              name: 'Gateway loss {#GWSTATUSNAME}'
              type: DEPENDENT
              key: 'opns.gw.status.loss[{#GWSTATUSNAME}]'
              delay: '0'
              value_type: FLOAT
              units: '%'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#GWSTATUSNAME}")].loss.first()'
                - type: NOT_MATCHES_REGEX
                  parameters:
                    - \~
                  error_handler: CUSTOM_VALUE
                  error_handler_params: '9999'
                - type: RTRIM
                  parameters:
                    - '%'
              master_item:
                key: opns.raw.gateway.status
              tags:
                - tag: Gateway
                  value: '{#GWSTATUSNAME}'
              trigger_prototypes:
                - uuid: c19ef9f23a4748a0a91bd86b9cc91e83
                  expression: 'min(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)>{$OPNS.GW.HIGH.PACKET.LOSS} and max(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)<=100'
                  name: 'Gateway {#GWSTATUSNAME} High packet loss'
                  priority: HIGH
                  dependencies:
                    - name: 'Gateway {#GWSTATUSNAME} is down'
                      expression: 'min(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)>99 and max(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)<=100'
                - uuid: 89f05eea06224a15bfe33977b378e846
                  expression: 'min(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)>99 and max(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)<=100'
                  name: 'Gateway {#GWSTATUSNAME} is down'
                  priority: DISASTER
                - uuid: 24002d47a9b24b058efa290ccb377335
                  expression: 'min(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)>{$OPNS.GW.MIN.PACKET.LOSS} and max(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)<=100'
                  name: 'Gateway {#GWSTATUSNAME} Packet loss'
                  priority: AVERAGE
                  dependencies:
                    - name: 'Gateway {#GWSTATUSNAME} High packet loss'
                      expression: 'min(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)>{$OPNS.GW.HIGH.PACKET.LOSS} and max(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}],5m)<=100'
            - uuid: 958e45fe885c46cca12c5a427d93e54f
              name: 'Gateway Status {#GWSTATUSNAME}'
              type: DEPENDENT
              key: 'opns.gw.status.status[{#GWSTATUSNAME}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#GWSTATUSNAME}")].status_translated.first()'
              master_item:
                key: opns.raw.gateway.status
              tags:
                - tag: Gateway
                  value: '{#GWSTATUSNAME}'
            - uuid: c05e44967fcc418bbf48c52c937422fd
              name: 'Gateway RTTd {#GWSTATUSNAME}'
              type: DEPENDENT
              key: 'opns.gw.status.stddev[{#GWSTATUSNAME}]'
              delay: '0'
              value_type: FLOAT
              units: ms
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#GWSTATUSNAME}")].stddev.first()'
                - type: NOT_MATCHES_REGEX
                  parameters:
                    - \~
                  error_handler: CUSTOM_VALUE
                  error_handler_params: '9999'
                - type: RTRIM
                  parameters:
                    - ms
              master_item:
                key: opns.raw.gateway.status
              tags:
                - tag: Gateway
                  value: '{#GWSTATUSNAME}'
          trigger_prototypes:
            - uuid: 6ee07909e65349ebb72ccd8c2754e1ea
              expression: 'last(/OPNsense by HTTP-JSON/opns.gw.status.loss[{#GWSTATUSNAME}])=9999 and last(/OPNsense by HTTP-JSON/opns.gw.status.stddev[{#GWSTATUSNAME}])=9999 and last(/OPNsense by HTTP-JSON/opns.gw.status.delay[{#GWSTATUSNAME}])=9999'
              name: 'Gateway Monitoring on {#GWSTATUSNAME} is disabled'
              priority: AVERAGE
              description: 'please enable Gateway Monitoring: https://docs.opnsense.org/manual/gateways.html'
          master_item:
            key: opns.raw.gateway.status
          lld_macro_paths:
            - lld_macro: '{#GWSTATUSNAME}'
              path: $.name
        - uuid: 806a32bff1f7404dae6418990e59d210
          name: 'Interface CARP Discovery'
          type: DEPENDENT
          key: opns.interface.carp.discovery
          delay: '0'
          lifetime: 1d
          item_prototypes:
            - uuid: bcd3129d95bc4fec85eef33485aa454d
              name: 'Carp Status of {#OPNS.INTERFACE.NAME}'
              type: DEPENDENT
              key: 'opns.carp.status[{#OPNS.INTERFACE.NAME}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["interface"] == "{#OPNS.INTERFACE.NAME}")].["status"].first()'
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 2h
              master_item:
                key: opns.raw.interfaces.carp
              trigger_prototypes:
                - uuid: e5f549c43e8c4e99a0babe831f84bc4e
                  expression: 'change(/OPNsense by HTTP-JSON/opns.carp.status[{#OPNS.INTERFACE.NAME}])<>0'
                  name: 'Carp Status Changed on {#OPNS.INTERFACE.NAME}'
                  opdata: '{#OPNS.INTERFACE.NAME}: {ITEM.LASTVALUE}'
                  priority: HIGH
          master_item:
            key: opns.raw.interfaces.carp
          lld_macro_paths:
            - lld_macro: '{#OPNS.INTERFACE.NAME}'
              path: $.interface
          preprocessing:
            - type: JSONPATH
              parameters:
                - '$.rows[*]'
              error_handler: CUSTOM_ERROR
              error_handler_params: 'Could not locate any defined CARP interfaces.'
        - uuid: 9941458d7de1441e950799233705bdbe
          name: 'Interface Stats Discovery'
          type: DEPENDENT
          key: opns.interface.stats.discovery
          delay: '0'
          item_prototypes:
            - uuid: 789203e62ec945f59354f25145cf1332
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: Bytes received'
              type: DEPENDENT
              key: 'opns.interface.bytes.received[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["bytes received"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 193d6a0bab5a461ea66c2e6111e2cff3
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: Bytes transmitted'
              type: DEPENDENT
              key: 'opns.interface.bytes.transmitted[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["bytes transmitted"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 5358a5f8ce82438b944064510bc41c32
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: collisions'
              type: DEPENDENT
              key: 'opns.interface.collisions[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["collisions"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 7da6790469d9472dbf6c280d3005a4f1
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: blocked bytes INv4'
              type: DEPENDENT
              key: 'opns.interface.fw.bytes.blockin.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["in4_block_bytes"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 160193b965374945916b3e5200e599e0
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: blocked bytes OUTv4'
              type: DEPENDENT
              key: 'opns.interface.fw.bytes.blockout.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["out4_block_bytes"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 311e78d7cdf64d128c8364f71359856c
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: passed bytes INv4'
              type: DEPENDENT
              key: 'opns.interface.fw.bytes.passin.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["in4_pass_bytes"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 5c7bab186db8413789152cb88bba36de
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: passed bytes OUTv4'
              type: DEPENDENT
              key: 'opns.interface.fw.bytes.passout.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["out4_pass_bytes"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: a606bd62e4b14e7ca17f1120a72de03d
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: blocked packets INv4'
              type: DEPENDENT
              key: 'opns.interface.fw.packets.blockin.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["in4_block_packets"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: e3031b6d3b904aa9b8d38ece734f29f8
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: blocked packets OUTv4'
              type: DEPENDENT
              key: 'opns.interface.fw.packets.blockout.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["out4_block_packets"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 19d8084e9e414b38a2d41729f37f5f55
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: passed packets INv4'
              type: DEPENDENT
              key: 'opns.interface.fw.packets.passin.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["in4_pass_packets"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 7f1a340e4f2d403e9ee052fc2e4d9e90
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: passed packets OUTv4'
              type: DEPENDENT
              key: 'opns.interface.fw.packets.passout.v4[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.interfaces.["{#OPNS.INTERFACE.DEVICE}"].["out4_pass_packets"]'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.fw.interface.stat
              tags:
                - tag: component
                  value: firewall
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 586cf3bf6e554e9786977aa873d07b9b
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: input queue drops'
              type: DEPENDENT
              key: 'opns.interface.input.queue.drops[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["input queue drops"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 85927270d9ad48e38b9805ec27e55850
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: multicasts received'
              type: DEPENDENT
              key: 'opns.interface.multicast.received[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["multicasts received"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 0e613cc99107419ea3864bafb4d35612
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: output errors'
              type: DEPENDENT
              key: 'opns.interface.output.errors[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["output errors"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 71985c6a0b4141fc8d509f2d930446c0
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: packets received'
              type: DEPENDENT
              key: 'opns.interface.packets.received[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["packets received"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: c55d425c6f6d484189ee66f5adbf369c
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: packets transmitted'
              type: DEPENDENT
              key: 'opns.interface.packets.transmitted[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["packets transmitted"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
            - uuid: 9b71dc0d825540f8a19df4b6588826f2
              name: 'Interface [{#OPNS.INTERFACE.DEVICE}({#OPNS.INTERFACE.NAME})]: packets for unknown protocol'
              type: DEPENDENT
              key: 'opns.interface.packets.unknown.protocol[{#OPNS.INTERFACE.DEVICE}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#OPNS.INTERFACE.NAME}")].["packets for unknown protocol"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: description
                  value: '{#OPNS.INTERFACE.NAME}'
                - tag: interface
                  value: '{#OPNS.INTERFACE.DEVICE}'
          master_item:
            key: opns.raw.interfaces.stat
          lld_macro_paths:
            - lld_macro: '{#OPNS.INTERFACE.DEVICE}'
              path: $.device
            - lld_macro: '{#OPNS.INTERFACE.NAME}'
              path: $.name
        - uuid: e53f5f66e0db470b9e1b6bd32384d070
          name: 'IPsec Phase1 Discovery'
          type: DEPENDENT
          key: opns.ipsec.phase1.discovery
          delay: '0'
          item_prototypes:
            - uuid: ffa45f7dfdcd44c685de761513189f6d
              name: '{#IPSECDESC} bytes per second in'
              type: DEPENDENT
              key: 'opn.ipsecph1.bytes.in.second[{#IPSECDESC}]'
              delay: '0'
              value_type: FLOAT
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-in"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase1'
                  value: '{#IPSECNAME}'
            - uuid: e4c7a304beb64a1f95acbe298b578861
              name: '{#IPSECDESC} bytes-in total'
              type: DEPENDENT
              key: 'opn.ipsecph1.bytes.in.total[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-in"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase1'
                  value: '{#IPSECNAME}'
            - uuid: ed6607724f1f438eab7494a7f1326fba
              name: '{#IPSECDESC} bytes per second out'
              type: DEPENDENT
              key: 'opn.ipsecph1.bytes.out.second[{#IPSECDESC}]'
              delay: '0'
              value_type: FLOAT
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-out"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase1'
                  value: '{#IPSECNAME}'
            - uuid: 7ce8f417995c439cb349b2be08f18122
              name: '{#IPSECDESC} bytes-out total'
              type: DEPENDENT
              key: 'opn.ipsecph1.bytes.out.total[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-out"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase1'
                  value: '{#IPSECNAME}'
            - uuid: a0e49b7890db4f9888353b7c4646c1cf
              name: '{#IPSECDESC} connected'
              type: DEPENDENT
              key: 'opn.ipsecph1.connected[{#IPSECDESC}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["connected"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase1'
                  value: '{#IPSECNAME}'
              trigger_prototypes:
                - uuid: 20c763dea4f54f7fa388488676f4362c
                  expression: 'find(/OPNsense by HTTP-JSON/opn.ipsecph1.connected[{#IPSECDESC}],,"like","true")=0'
                  name: 'IPSec Tunnel {#IPSECDESC} is not connected'
                  priority: HIGH
            - uuid: f83422d4d29148bf939c926c22b8d131
              name: '{#IPSECDESC} lcoaladdress'
              type: DEPENDENT
              key: 'opn.ipsecph1.localaddress[{#IPSECDESC}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["local-addrs"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase1'
                  value: '{#IPSECNAME}'
            - uuid: bd094323b26645a4952de246b3ff4912
              name: '{#IPSECDESC} bytes-in per second'
              type: DEPENDENT
              key: 'opn.ipsecph2.bytes.in.second[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-in"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: 87d602f4b186490db33bde839ba155d1
              name: '{#IPSECDESC} bytes-in'
              type: DEPENDENT
              key: 'opn.ipsecph2.bytes.in[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-in"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: bdf51a903bfd4fe1b82e633005ce68ab
              name: '{#IPSECDESC} bytes-out per second'
              type: DEPENDENT
              key: 'opn.ipsecph2.bytes.out.second[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-out"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: 03157dc913264295a572ca7173111976
              name: '{#IPSECDESC} bytes-out'
              type: DEPENDENT
              key: 'opn.ipsecph2.bytes.out[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["bytes-out"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: 2a092b018aa144aca810863f3db76906
              name: '{#IPSECDESC} mode'
              type: DEPENDENT
              key: 'opn.ipsecph2.mode[{#IPSECDESC}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[0][''mode'']'
              master_item:
                key: 'opns.ipsec.phase2.raw[{#IPSECNAME}]'
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: 413359f74125473b9016a77062d25a6f
              name: '{#IPSECDESC} packets-in per second'
              type: DEPENDENT
              key: 'opn.ipsecph2.packets.in.second[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: P/s
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["packets-in"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: f6a1a0e363fc484c94a962827e4f8dfa
              name: '{#IPSECDESC} packets-in'
              type: DEPENDENT
              key: 'opn.ipsecph2.packets.in[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["packets-in"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: ec29b5514f084eaabdf307268f69157e
              name: '{#IPSECDESC} packets-out per second'
              type: DEPENDENT
              key: 'opn.ipsecph2.packets.out.second[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              units: P/s
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["packets-out"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: c680fb86f53f41639ee5a921c9b0a159
              name: '{#IPSECDESC} packets-out'
              type: DEPENDENT
              key: 'opn.ipsecph2.packets.out[{#IPSECDESC}]'
              delay: '0'
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["name"] == "{#IPSECNAME}")].["packets-out"].first()'
              master_item:
                key: opns.ipsec.phase1.raw
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: 187a9213483e4ed2bef55c1464c9d2cf
              name: '{#IPSECDESC} state'
              type: DEPENDENT
              key: 'opn.ipsecph2.state[{#IPSECDESC}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[0][''state'']'
              master_item:
                key: 'opns.ipsec.phase2.raw[{#IPSECNAME}]'
              tags:
                - tag: IPSEC
                  value: '{#IPSECDESC}'
                - tag: IPSEC
                  value: '{#IPSECNAME}'
                - tag: 'IPSEC Phase2'
                  value: '{#IPSECNAME}'
            - uuid: 3b4c41e92a0e48ebb97dfa5be3efb113
              name: 'IPsec {#IPSECDESC}: phase 2 (raw)'
              type: HTTP_AGENT
              key: 'opns.ipsec.phase2.raw[{#IPSECNAME}]'
              delay: 5m
              history: '0'
              value_type: TEXT
              trends: '0'
              authtype: BASIC
              username: '{$OPNS.KEY}'
              password: '{$OPNS.SECRET}'
              description: 'Child SAs of this connection. The endpoint takes the connection through a POST parameter and returns an empty set without it, which is why this is one request per tunnel rather than a single master item. The identifier is the name field of the phase 1 row, the same value the web interface sends. Only the two fields that exist nowhere else, mode and state, are read from here; the byte and packet counters come from the phase 1 master, which aggregates the same child SAs itself and costs no request per tunnel.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - $.rows
              timeout: 15s
              url: 'https://{HOST.IP}:{$OPNS.PORT}/api/ipsec/sessions/search_phase2'
              posts: 'id={#IPSECNAME}'
              headers:
                - name: Content-Type
                  value: application/x-www-form-urlencoded
              tags:
                - tag: component
                  value: raw
          trigger_prototypes:
            - uuid: 5d24b625aaa3450bbce7da3fd28f14aa
              expression: '(change(/OPNsense by HTTP-JSON/opn.ipsecph1.bytes.out.total[{#IPSECDESC}])=0 or change(/OPNsense by HTTP-JSON/opn.ipsecph1.bytes.in.total[{#IPSECDESC}])=0) and find(/OPNsense by HTTP-JSON/opn.ipsecph1.connected[{#IPSECDESC}],,"like","connected")=1'
              name: 'IPSec Tunnel {#IPSECDESC} no traffic'
              priority: WARNING
          master_item:
            key: opns.ipsec.phase1.raw
          lld_macro_paths:
            - lld_macro: '{#IPSECDESC}'
              path: $.phase1desc
            - lld_macro: '{#IPSECNAME}'
              path: $.name
        - uuid: dfc73d2ea8a04ad3a74614eeda0358d8
          name: 'Network interfaces (link state and inbound errors)'
          type: DEPENDENT
          key: opns.net.if.discovery
          delay: '0'
          filter:
            evaltype: AND
            conditions:
              - macro: '{#IFNAME}'
                value: '{$OPNS.IF.NAME.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: A
          description: 'One entry per physical and virtual interface. Only link level rows are used, because the per address rows count traffic per IP rather than per interface. Interfaces matching the exclusion macro are skipped.'
          item_prototypes:
            - uuid: 89ba2864b0554be6ab9cb5f28e40a794
              name: 'Interface {#IFALIAS} ({#IFNAME}): Inbound errors'
              type: DEPENDENT
              key: 'opns.net.if.in.errors[{#IFNAME}]'
              delay: '0'
              value_type: FLOAT
              description: 'Receive errors on this interface. Points at cabling, an optic or the link partner.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.device == "{#IFNAME}")][''input errors''].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: interface
                  value: '{#IFNAME}'
            - uuid: 333665cb55f44b86895f3354190ba482
              name: 'Interface {#IFALIAS} ({#IFNAME}): Link status'
              type: DEPENDENT
              key: 'opns.net.if.status[{#IFNAME}]'
              delay: '0'
              description: 'Derived from the BSD interface flags: bit 0 is UP, the administrative state, and bit 6 is RUNNING, which is set once the interface has a usable link. Both must be set for the interface to count as up.'
              valuemap:
                name: 'Link status'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.device == "{#IFNAME}")][''link state''].first()'
                - type: STR_REPLACE
                  parameters:
                    - '1'
                    - '0'
                - type: STR_REPLACE
                  parameters:
                    - '2'
                    - '1'
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.raw.interfaces.stat
              tags:
                - tag: component
                  value: network
                - tag: interface
                  value: '{#IFNAME}'
              trigger_prototypes:
                - uuid: 2961818fa4f84cbea07cc4d394b37a48
                  expression: 'last(/OPNsense by HTTP-JSON/opns.net.if.status[{#IFNAME}])=0 and {$OPNS.IF.CONTROL:"{#IFNAME}"}=1'
                  name: 'OPNsense: Interface {#IFALIAS} ({#IFNAME}) is down'
                  priority: AVERAGE
                  description: 'The link is gone or the interface was shut down. Set {$OPNS.IF.CONTROL:"{#IFNAME}"} to 0 for interfaces that are allowed to be down, such as a cold standby uplink.'
                  manual_close: 'YES'
                  tags:
                    - tag: scope
                      value: availability
          master_item:
            key: opns.raw.interfaces.stat
          lld_macro_paths:
            - lld_macro: '{#IFALIAS}'
              path: $.name
            - lld_macro: '{#IFNAME}'
              path: $.device
        - uuid: a0f3261aecdd4727bea505b96e43ebd2
          name: 'netisr queues'
          type: DEPENDENT
          key: opns.netisr.discovery
          delay: '0'
          description: 'One entry per protocol queue. The summed counter alerts, these tell you which queue is the one overflowing.'
          item_prototypes:
            - uuid: 41ec695307ab43ffb2e79c93969970bb
              name: 'netisr {#NETISR.PROTO}: Queue drops'
              type: DEPENDENT
              key: 'opns.netisr.queue.drops[{#NETISR.PROTO}]'
              delay: '0'
              value_type: FLOAT
              units: '!/s'
              description: 'Packets discarded from this protocol queue before reaching the firewall rules. Identifies which queue the summed counter is reacting to.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.netisr.workstream[*].work[?(@.name == "{#NETISR.PROTO}")][''queue-drops''].sum()'
              master_item:
                key: opns.netisr.raw
              tags:
                - tag: component
                  value: network
                - tag: protocol
                  value: '{#NETISR.PROTO}'
          master_item:
            key: opns.netisr.raw
          lld_macro_paths:
            - lld_macro: '{#NETISR.PROTO}'
              path: $.name
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.netisr.protocol
        - uuid: 24530ff8391c4fb190bb500176a7038a
          name: 'OpenVPN instances and clients'
          type: DEPENDENT
          key: opns.openvpn.discovery
          delay: '0'
          filter:
            evaltype: AND
            conditions:
              - macro: '{#OVPN.ID}'
                value: '{$OPNS.OPENVPN.ID.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: A
          description: 'One entity per instance, plus one per client connected to a server. A client carries the instance id and the client address in its own id, so the two never collide.'
          item_prototypes:
            - uuid: f78154821a884d9990693bca8f2a9fea
              name: 'OpenVPN {#OVPN.DESC} ({#OVPN.TYPE}): bytes received per second'
              type: DEPENDENT
              key: 'opns.openvpn.bytes.in.rate[{#OVPN.ID}]'
              delay: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.id == "{#OVPN.ID}")].bytes_received.first()'
                  error_handler: DISCARD_VALUE
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.openvpn.raw
              tags:
                - tag: component
                  value: openvpn
                - tag: openvpn
                  value: '{#OVPN.DESC}'
            - uuid: 882d30da10904945859d4651288f9939
              name: 'OpenVPN {#OVPN.DESC} ({#OVPN.TYPE}): bytes received'
              type: DEPENDENT
              key: 'opns.openvpn.bytes.in[{#OVPN.ID}]'
              delay: '0'
              units: B
              description: 'Total received on this instance or client.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.id == "{#OVPN.ID}")].bytes_received.first()'
                  error_handler: DISCARD_VALUE
              master_item:
                key: opns.openvpn.raw
              tags:
                - tag: component
                  value: openvpn
                - tag: openvpn
                  value: '{#OVPN.DESC}'
            - uuid: 6d242eb6f8d34bea96d8cc0926d7d22b
              name: 'OpenVPN {#OVPN.DESC} ({#OVPN.TYPE}): bytes sent per second'
              type: DEPENDENT
              key: 'opns.openvpn.bytes.out.rate[{#OVPN.ID}]'
              delay: '0'
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.id == "{#OVPN.ID}")].bytes_sent.first()'
                  error_handler: DISCARD_VALUE
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.openvpn.raw
              tags:
                - tag: component
                  value: openvpn
                - tag: openvpn
                  value: '{#OVPN.DESC}'
            - uuid: c2ea7d498f624345b73abcef3db011e7
              name: 'OpenVPN {#OVPN.DESC} ({#OVPN.TYPE}): bytes sent'
              type: DEPENDENT
              key: 'opns.openvpn.bytes.out[{#OVPN.ID}]'
              delay: '0'
              units: B
              description: 'Total sent on this instance or client.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.id == "{#OVPN.ID}")].bytes_sent.first()'
                  error_handler: DISCARD_VALUE
              master_item:
                key: opns.openvpn.raw
              tags:
                - tag: component
                  value: openvpn
                - tag: openvpn
                  value: '{#OVPN.DESC}'
            - uuid: c835d32efadb4c2eb7aff3fb6bf47ff7
              name: 'OpenVPN {#OVPN.DESC} ({#OVPN.TYPE}): status'
              type: DEPENDENT
              key: 'opns.openvpn.status[{#OVPN.ID}]'
              delay: '0'
              value_type: CHAR
              trends: '0'
              description: 'ok while the instance answers on its management socket. An enabled instance that is not running reports nothing at all, which the trigger treats as down.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.id == "{#OVPN.ID}")].status.first()'
                  error_handler: DISCARD_VALUE
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.openvpn.raw
              tags:
                - tag: component
                  value: openvpn
                - tag: openvpn
                  value: '{#OVPN.DESC}'
              trigger_prototypes:
                - uuid: 0afbde530f814c0b9b877d8ee75f01d7
                  expression: 'find(/OPNsense by HTTP-JSON/opns.openvpn.status[{#OVPN.ID}],10m,"regexp","^ok$")=0 and {$OPNS.OPENVPN.CONTROL:"{#OVPN.DESC}"}=1'
                  name: 'OpenVPN {#OVPN.DESC} ({#OVPN.TYPE}) is not up'
                  priority: AVERAGE
                  description: 'The instance has not reported a working management socket for ten minutes. Set {$OPNS.OPENVPN.CONTROL} to 0, per instance through macro context, for instances that are allowed to be down.'
                  manual_close: 'YES'
          master_item:
            key: opns.openvpn.raw
          lld_macro_paths:
            - lld_macro: '{#OVPN.DESC}'
              path: $.description
            - lld_macro: '{#OVPN.ID}'
              path: $.id
            - lld_macro: '{#OVPN.TYPE}'
              path: $.type
        - uuid: a16ab2ce320d40a0ac26ffad1236a5b5
          name: Services
          type: DEPENDENT
          key: opns.services.discovery
          delay: '0'
          filter:
            evaltype: AND
            conditions:
              - macro: '{#SERVICE.ID}'
                value: '{$OPNS.SERVICE.ID.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: A
          description: 'One entry per known service. Discovery keys on the identifier rather than the name, because a name can appear twice: the DHCP server registers once for IPv4 and once for IPv6 under the same name but distinct identifiers.'
          item_prototypes:
            - uuid: b86809e453d541abaebb3c960ee7b988
              name: 'Service {#SERVICE.DESCRIPTION}: Running'
              type: DEPENDENT
              key: 'opns.service.running[{#SERVICE.ID}]'
              delay: '0'
              description: 'Whether this service is running. The packet filter itself appears here, so a firewall that has been disabled while staying reachable becomes visible.'
              valuemap:
                name: 'Service state'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.rows[?(@.id == "{#SERVICE.ID}")].running.first()'
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 10m
              master_item:
                key: opns.services.raw
              tags:
                - tag: component
                  value: service
                - tag: service
                  value: '{#SERVICE.ID}'
              trigger_prototypes:
                - uuid: 2abc55e45c454dcb90358c413868267f
                  expression: 'min(/OPNsense by HTTP-JSON/opns.service.running[{#SERVICE.ID}],5m)=0'
                  name: 'OPNsense: Service {#SERVICE.DESCRIPTION} is not running'
                  priority: AVERAGE
                  description: 'The service has been down for five minutes. Add it to {$OPNS.SERVICE.ID.NOT_MATCHES} if it is not supposed to run on this firewall.'
                  manual_close: 'YES'
                  tags:
                    - tag: scope
                      value: availability
          master_item:
            key: opns.services.raw
          lld_macro_paths:
            - lld_macro: '{#SERVICE.DESCRIPTION}'
              path: $.description
            - lld_macro: '{#SERVICE.ID}'
              path: $.id
            - lld_macro: '{#SERVICE.NAME}'
              path: $.name
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.rows
        - uuid: 09085dc0de3646eba7e8843920a875f4
          name: 'Swap devices'
          type: DEPENDENT
          key: opns.swap.discovery
          delay: '0'
          description: 'Discovers nothing on installations without swap, which keeps the template free of unsupported items there.'
          item_prototypes:
            - uuid: 24f02935465c4f23b9ce7b28aa15339e
              name: 'Swap {#SWAPDEV}: utilization'
              type: CALCULATED
              key: 'opns.swap.pused[{#SWAPDEV}]'
              delay: 5m
              value_type: FLOAT
              units: '%'
              params: 'last(//opns.swap.used[{#SWAPDEV}]) / last(//opns.swap.total[{#SWAPDEV}]) * 100'
              description: 'Fill level of this swap device. A firewall that swaps at all is short on memory.'
              tags:
                - tag: component
                  value: memory
                - tag: swapdev
                  value: '{#SWAPDEV}'
              trigger_prototypes:
                - uuid: cc299348aaf043d5b9694938355e10a3
                  expression: 'min(/OPNsense by HTTP-JSON/opns.swap.pused[{#SWAPDEV}],10m)>{$OPNS.SWAP.UTIL.WARN:"{#SWAPDEV}"}'
                  name: 'OPNsense: Swap {#SWAPDEV} is in use'
                  priority: WARNING
                  description: 'A firewall that swaps is short on memory. Sustained swap usage costs throughput.'
                  manual_close: 'YES'
                  tags:
                    - tag: scope
                      value: performance
            - uuid: 7cb23f6225cc4cc29abe6f1cf24f2e0b
              name: 'Swap {#SWAPDEV}: total'
              type: DEPENDENT
              key: 'opns.swap.total[{#SWAPDEV}]'
              delay: '0'
              value_type: FLOAT
              units: B
              description: 'Size of this swap device.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.swap[?(@.device == "{#SWAPDEV}")].total.first()'
                - type: MULTIPLIER
                  parameters:
                    - '1024'
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.swap.raw
              tags:
                - tag: component
                  value: memory
                - tag: swapdev
                  value: '{#SWAPDEV}'
            - uuid: 576d7e44ed9e40f3af087fbf27450e73
              name: 'Swap {#SWAPDEV}: used'
              type: DEPENDENT
              key: 'opns.swap.used[{#SWAPDEV}]'
              delay: '0'
              value_type: FLOAT
              units: B
              description: 'Swap in use on this device.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$.swap[?(@.device == "{#SWAPDEV}")].used.first()'
                - type: MULTIPLIER
                  parameters:
                    - '1024'
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 1h
              master_item:
                key: opns.swap.raw
              tags:
                - tag: component
                  value: memory
                - tag: swapdev
                  value: '{#SWAPDEV}'
          master_item:
            key: opns.swap.raw
          lld_macro_paths:
            - lld_macro: '{#SWAPDEV}'
              path: $.device
          preprocessing:
            - type: JSONPATH
              parameters:
                - $.swap
        - uuid: dbbe89f12b974a2287314e8e4da7587c
          name: 'Temperature sensors'
          type: DEPENDENT
          key: opns.temperature.discovery
          delay: '0'
          description: 'The endpoint returns a JSON array at the root. Virtual machines report no sensors, so nothing is discovered and nothing goes unsupported.'
          item_prototypes:
            - uuid: 1652efeaa646437382ac17023949aec6
              name: 'Temperature {#DEVICE}'
              type: DEPENDENT
              key: 'opns.temperature[{#DEVICE}]'
              delay: '0'
              value_type: FLOAT
              units: °C
              description: 'Reading of one hardware sensor. Which physical component it describes depends on the platform, the sensor name carries that.'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$[?(@.device == "{#DEVICE}")].temperature.first()'
                - type: DISCARD_UNCHANGED_HEARTBEAT
                  parameters:
                    - 3m
              master_item:
                key: opns.temperature.raw
              tags:
                - tag: component
                  value: temperature
                - tag: sensor
                  value: '{#DEVICE}'
              trigger_prototypes:
                - uuid: 9da77f2ce0cb442683dc4ffb6bf938f9
                  expression: 'avg(/OPNsense by HTTP-JSON/opns.temperature[{#DEVICE}],5m)>{$OPNS.TEMP.CRIT:"{#DEVICE}"}'
                  name: 'OPNsense: Sensor {#DEVICE} is running hot'
                  priority: HIGH
                  description: 'Sustained high temperature. Check fans, filters and ambient temperature. Adjust {$OPNS.TEMP.CRIT} per hardware, the default suits most x86 appliances.'
                  manual_close: 'YES'
                  tags:
                    - tag: scope
                      value: hardware
          graph_prototypes:
            - uuid: c4a7585c209f4375bf9fa6ea75ef841a
              name: 'Temperature {#DEVICE}'
              graph_items:
                - color: E53935
                  item:
                    host: 'OPNsense by HTTP-JSON'
                    key: 'opns.temperature[{#DEVICE}]'
          master_item:
            key: opns.temperature.raw
          lld_macro_paths:
            - lld_macro: '{#DEVICE}'
              path: $.device
            - lld_macro: '{#TYPE}'
              path: $.type
        - uuid: 36c000378e754ccb9475fa047160fd8f
          name: 'WireGuard Instance Discovery'
          type: DEPENDENT
          key: opns.wireguard.instance.discovery
          delay: '0'
          filter:
            conditions:
              - macro: '{#WG.INSTANCE}'
                value: '{$OPNS.WG.INSTANCE.MATCHES}'
                formulaid: A
              - macro: '{#WG.INSTANCE}'
                value: '{$OPNS.WG.INSTANCE.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: B
          lifetime: 1h
          item_prototypes:
            - uuid: 9b6b1a92c9384e8ea4d3302fb701f494
              name: 'WireGuard instance {#WG.INSTANCE}: listen port'
              type: DEPENDENT
              key: 'opns.wireguard.instance.listen_port[{#WG.IF}]'
              delay: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.if == "{#WG.IF}")].["listen-port"].first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.INSTANCE}'
            - uuid: 5a01a56577a74926a311bbdcff64543f
              name: 'WireGuard instance {#WG.INSTANCE}: public key'
              type: DEPENDENT
              key: 'opns.wireguard.instance.public_key[{#WG.IF}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.if == "{#WG.IF}")].["public-key"].first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.INSTANCE}'
            - uuid: 5946da75329d435b93d24a25ed70d5ff
              name: 'WireGuard instance {#WG.INSTANCE}: status'
              type: DEPENDENT
              key: 'opns.wireguard.instance.status[{#WG.IF}]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.if == "{#WG.IF}")].status.first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.INSTANCE}'
              trigger_prototypes:
                - uuid: 290408665fab4886ab6d4ef2c35bda65
                  expression: 'find(/OPNsense by HTTP-JSON/opns.wireguard.instance.status[{#WG.IF}],5m,"eq","up")=0'
                  name: 'WireGuard instance {#WG.INSTANCE} is down'
                  priority: HIGH
          master_item:
            key: opns.wireguard.raw
          lld_macro_paths:
            - lld_macro: '{#WG.IF}'
              path: $.if
            - lld_macro: '{#WG.INSTANCE}'
              path: $.name
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  var rows = JSON.parse(value);
                  var instances = [];
                  for (var i = 0; i < rows.length; i++) {
                      if (rows[i].type === 'interface') {
                          if (rows[i].name === '') {
                              rows[i].name = rows[i].if;
                          }
                          instances.push(rows[i]);
                      }
                  }
                  return JSON.stringify(instances);
        - uuid: 3f23060d61274c6d9beb2087f259bd54
          name: 'WireGuard Peer Discovery'
          type: DEPENDENT
          key: opns.wireguard.peer.discovery
          delay: '0'
          filter:
            conditions:
              - macro: '{#WG.IFNAME}'
                value: '{$OPNS.WG.INSTANCE.MATCHES}'
                formulaid: A
              - macro: '{#WG.IFNAME}'
                value: '{$OPNS.WG.INSTANCE.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: B
              - macro: '{#WG.NAME}'
                value: '{$OPNS.WG.PEER.MATCHES}'
                formulaid: C
              - macro: '{#WG.NAME}'
                value: '{$OPNS.WG.PEER.NOT_MATCHES}'
                operator: NOT_MATCHES_REGEX
                formulaid: D
          lifetime: 1h
          item_prototypes:
            - uuid: d1c0192b3c194c73be8cb62a8635de5e
              name: 'WireGuard peer {#WG.NAME}: endpoint'
              type: DEPENDENT
              key: 'opns.wireguard.peer.endpoint["{#WG.PUBKEY}"]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].endpoint.first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
            - uuid: 5c886d9ab9bf4569acd058a1f060d306
              name: 'WireGuard peer {#WG.NAME}: latest handshake'
              type: DEPENDENT
              key: 'opns.wireguard.peer.latest_handshake["{#WG.PUBKEY}"]'
              delay: '0'
              units: unixtime
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["latest-handshake"].first()'
                - type: JAVASCRIPT
                  parameters:
                    - |
                      if (value === null || value === '' || value === 'null') {
                          return 0;
                      }
                      return value;
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
            - uuid: c373db13af244a14b21d582905d4dfa4
              name: 'WireGuard peer {#WG.NAME}: latest handshake age'
              type: DEPENDENT
              key: 'opns.wireguard.peer.latest_handshake_age["{#WG.PUBKEY}"]'
              delay: '0'
              units: s
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["latest-handshake-age"].first()'
                - type: JAVASCRIPT
                  parameters:
                    - |
                      if (value === null || value === '' || value === 'null') {
                          return 0;
                      }
                      return value;
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
            - uuid: 7397099101c74754bc0d639b37b8bbc9
              name: 'WireGuard peer {#WG.NAME}: status'
              type: DEPENDENT
              key: 'opns.wireguard.peer.status["{#WG.PUBKEY}"]'
              delay: '0'
              value_type: TEXT
              trends: '0'
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["peer-status"].first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
              trigger_prototypes:
                - uuid: bbb8926ace0b483fa7d397703e47d4d2
                  expression: 'find(/OPNsense by HTTP-JSON/opns.wireguard.peer.status["{#WG.PUBKEY}"],5m,"eq","online")=0'
                  name: 'WireGuard peer {#WG.NAME} is not online'
                  priority: HIGH
                  description: 'WireGuard peer status is stale or offline. OPNsense marks peers online when the latest handshake is not older than 300 seconds.'
            - uuid: 4fa44cf6d91b4d7595bedb07cdfe480a
              name: 'WireGuard peer {#WG.NAME}: bytes received per second'
              type: DEPENDENT
              key: 'opns.wireguard.peer.transfer_rx.rate["{#WG.PUBKEY}"]'
              delay: '0'
              value_type: FLOAT
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["transfer-rx"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
            - uuid: e58a63a78b5249f0b579dd0cbd82c0f3
              name: 'WireGuard peer {#WG.NAME}: bytes received'
              type: DEPENDENT
              key: 'opns.wireguard.peer.transfer_rx["{#WG.PUBKEY}"]'
              delay: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["transfer-rx"].first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
            - uuid: df146ef2cc8b4ea59da11b0516befbfe
              name: 'WireGuard peer {#WG.NAME}: bytes sent per second'
              type: DEPENDENT
              key: 'opns.wireguard.peer.transfer_tx.rate["{#WG.PUBKEY}"]'
              delay: '0'
              value_type: FLOAT
              units: Bps
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["transfer-tx"].first()'
                - type: CHANGE_PER_SECOND
                  parameters:
                    - ''
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
            - uuid: e74a5d5c709a4ff7932195f5a7d1728b
              name: 'WireGuard peer {#WG.NAME}: bytes sent'
              type: DEPENDENT
              key: 'opns.wireguard.peer.transfer_tx["{#WG.PUBKEY}"]'
              delay: '0'
              units: B
              preprocessing:
                - type: JSONPATH
                  parameters:
                    - '$..[?(@.["public-key"] == "{#WG.PUBKEY}")].["transfer-tx"].first()'
              master_item:
                key: opns.wireguard.raw
              tags:
                - tag: interface
                  value: '{#WG.IF}'
                - tag: WireGuard
                  value: '{#WG.NAME}'
          master_item:
            key: opns.wireguard.raw
          lld_macro_paths:
            - lld_macro: '{#WG.IFNAME}'
              path: $.ifname
            - lld_macro: '{#WG.IF}'
              path: $.if
            - lld_macro: '{#WG.NAME}'
              path: $.name
            - lld_macro: '{#WG.PUBKEY}'
              path: $.public_key
          preprocessing:
            - type: JAVASCRIPT
              parameters:
                - |
                  var rows = JSON.parse(value);
                  var peers = [];
                  for (var i = 0; i < rows.length; i++) {
                      if (rows[i].type === 'peer') {
                          rows[i].public_key = rows[i]['public-key'];
                          if (rows[i].ifname === '' || rows[i].ifname === null) {
                              rows[i].ifname = rows[i].if;
                          }
                          if (rows[i].name === '') {
                              rows[i].name = rows[i]['public-key'];
                          }
                          peers.push(rows[i]);
                      }
                  }
                  return JSON.stringify(peers);
      macros:
        - macro: '{$OPNS.CPU.LOAD.MAX}'
          value: '2'
        - macro: '{$OPNS.CPU.UTIL.WARN}'
          value: '85'
          description: 'Processor utilisation that counts as high, averaged over ten minutes.'
        - macro: '{$OPNS.FS.FSNAME.MATCHES}'
          value: .+
          description: 'Used for filesystem discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.FS.FSNAME.NOT_MATCHES}'
          value: ^(/dev|/sys|/run|/proc|.+/shm$)
          description: 'Used for filesystem discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.FS.FSTYPE.MATCHES}'
          value: ^(btrfs|ext2|ext3|ext4|reiser|xfs|ffs|ufs|jfs|jfs2|vxfs|hfs|apfs|refs|ntfs|fat32|zfs)$
          description: 'Used for filesystem discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.FS.FSTYPE.NOT_MATCHES}'
          value: ^\s$
          description: 'Used for filesystem discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.FS.PUSED.MAX.CRIT}'
          value: '95'
          description: 'The critical threshold of the filesystem utilization.'
        - macro: '{$OPNS.FS.PUSED.MAX.WARN}'
          value: '90'
          description: 'The warning threshold of the filesystem utilization.'
        - macro: '{$OPNS.GW.HIGH.PACKET.LOSS}'
          value: '50'
        - macro: '{$OPNS.GW.MIN.PACKET.LOSS}'
          value: '10'
        - macro: '{$OPNS.IF.CONTROL}'
          value: '1'
          description: 'Set to 0, optionally per interface as {$OPNS.IF.CONTROL:"vtnet3"}, to stop the down trigger for interfaces that are allowed to have no link.'
        - macro: '{$OPNS.IF.NAME.NOT_MATCHES}'
          value: '^(pflog|pfsync|enc|lo)\d*$'
          description: 'Interfaces that should not be discovered.'
        - macro: '{$OPNS.KEY}'
        - macro: '{$OPNS.LICENSE.EXPIRY.WARN}'
          value: '30'
        - macro: '{$OPNS.LOAD.AVG5.WARN}'
          value: '4'
          description: 'Absolute five minute load average that counts as high. Depends on the core count, which is why the per core trigger is usually the better one.'
        - macro: '{$OPNS.LOAD.PERCORE.WARN}'
          value: '1'
          description: 'Five minute load per core that counts as high. A value of 1 means the cores are exactly saturated.'
        - macro: '{$OPNS.MBUF.UTIL.WARN}'
          value: '80'
          description: 'Percentage of the mbuf cluster limit in use that counts as filling up.'
        - macro: '{$OPNS.MEMORY.UTIL.MAX}'
          value: '90'
        - macro: '{$OPNS.NTP.OFFSET.WARN}'
          value: '100'
          description: 'Clock offset in milliseconds that counts as high. 100 is generous for a LAN time source and still far below what breaks Kerberos or IPsec.'
        - macro: '{$OPNS.NUT.BAT.LOW}'
          value: '30'
        - macro: '{$OPNS.NUT.BAT.RUNTIME}'
          value: '600'
          description: 'Remaining battery runtime in seconds'
        - macro: '{$OPNS.NUT.HIGH.LOAD}'
          value: '80'
        - macro: '{$OPNS.OPENVPN.CONTROL}'
          value: '1'
          description: 'Set to 0, optionally per instance through macro context, to stop the down trigger for instances that are allowed not to run.'
        - macro: '{$OPNS.OPENVPN.ID.NOT_MATCHES}'
          value: ^$
          description: 'Instances or clients excluded from discovery, as a regular expression over the identifier. The default excludes nothing.'
        - macro: '{$OPNS.PF.SRCNODES.UTIL.CRIT}'
          value: '90'
          description: 'Fill level of the source tracking table that counts as critical.'
        - macro: '{$OPNS.PF.TABLES.UTIL.WARN}'
          value: '80'
          description: 'Share of the pf table entry budget that counts as filling up. Relevant where block lists or GeoIP aliases are in use.'
        - macro: '{$OPNS.PORT}'
          value: '443'
          description: 'HTTPS API Port'
        - macro: '{$OPNS.SECRET}'
        - macro: '{$OPNS.SERVICE.ID.NOT_MATCHES}'
          value: ^$
          description: 'Services excluded from discovery, as a regular expression over the service identifier. The default excludes nothing.'
        - macro: '{$OPNS.STATE.TABLE.UTIL.MAX}'
          value: '90'
        - macro: '{$OPNS.SWAP.UTIL.WARN}'
          value: '5'
          description: 'A firewall should not swap at all, so the default is deliberately low. Can be overridden per device with the device path as context.'
        - macro: '{$OPNS.TEMP.CRIT}'
          value: '80'
          description: 'Temperature threshold in degrees Celsius. Sensors on one board tolerate very different values, so this can be overridden per sensor with the sensor name as context, for example {$OPNS.TEMP.CRIT:"dev.cpu.0.temperature"}.'
        - macro: '{$OPNS.WG.INSTANCE.MATCHES}'
          value: .+
          description: 'Regex filter for WireGuard instance discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.WG.INSTANCE.NOT_MATCHES}'
          value: ^$
          description: 'Regex filter for excluding WireGuard instances from discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.WG.PEER.MATCHES}'
          value: .+
          description: 'Regex filter for WireGuard peer discovery. Can be overridden on the host or linked template level.'
        - macro: '{$OPNS.WG.PEER.NOT_MATCHES}'
          value: ^$
          description: 'Regex filter for excluding WireGuard peers from discovery. Can be overridden on the host or linked template level.'
      dashboards:
        - uuid: 7a4b378cb31c4d6fb3c4c69731653336
          name: 'OPNsense Info'
          pages:
            - name: Overview
              widgets:
                - type: gauge
                  name: Memory
                  width: '18'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'Memory utilization'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.memory.util
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: 'CPU load'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.cpu.load
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'Firewall actions'
                  'y': '6'
                  width: '36'
                  height: '5'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 2774A4
                    - type: STRING
                      name: ds.0.items.0
                      value: 'Firewall action*'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: FWACT
                - type: honeycomb
                  name: Filesystems
                  'y': '11'
                  width: '72'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'FS *: Space: Used, in %'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("FS \[(.*)\]: Space", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: FSHNY
                    - type: STRING
                      name: secondary_label_units
                      value: '%'
                    - type: STRING
                      name: thresholds.0.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.2.color
                      value: E53935
                    - type: STRING
                      name: thresholds.2.threshold
                      value: '90'
                - type: item
                  name: Uptime
                  x: '12'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.system.uptime
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: gauge
                  name: 'State table'
                  x: '18'
                  width: '18'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'pf states'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.states.util
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: Version
                  x: '24'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.version
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: gauge
                  name: Processor
                  x: '36'
                  width: '18'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'CPU utilization'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.cpu.util
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: Firmware
                  x: '36'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.firmware.update.status
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: honeycomb
                  name: CARP
                  x: '36'
                  'y': '6'
                  width: '36'
                  height: '5'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'Carp Status of *'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("Carp Status of (.*)", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: CARPH
                - type: item
                  name: 'States in use'
                  x: '48'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.fw.states.current
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: gauge
                  name: 'Load per core'
                  x: '54'
                  width: '18'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'Load per core'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.system.load.percore
                    - type: STRING
                      name: max
                      value: '4'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '1'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '2'
                - type: item
                  name: 'State limit'
                  x: '60'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.fw.states.max
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
            - name: 'Packet filter'
              widgets:
                - type: gauge
                  name: 'State table'
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'State table'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.states.util
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: 'States in use'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.fw.states.current
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Ruleset fingerprint'
                  'y': '6'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.rules.fingerprint
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'State table churn'
                  'y': '9'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: INTEGER
                      name: ds.0.fill
                      value: '2'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'pf: State table inserts per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'pf: State table removals per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: PFCHU
                - type: svggraph
                  name: 'Rule matches and evaluations'
                  'y': '15'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: INTEGER
                      name: ds.0.fill
                      value: '2'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'pf: Rule matches per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'pf: Rule evaluations per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: PFMAT
                - type: svggraph
                  name: 'Malformed packets'
                  'y': '21'
                  width: '72'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'pf: Bad offset packets per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'pf: Short packets per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: STRING
                      name: ds.2.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.2.fill
                      value: '0'
                    - type: STRING
                      name: ds.2.items.0
                      value: 'pf: Fragmented packets per second'
                    - type: INTEGER
                      name: ds.2.width
                      value: '2'
                    - type: STRING
                      name: ds.3.color
                      value: 00897B
                    - type: INTEGER
                      name: ds.3.fill
                      value: '0'
                    - type: STRING
                      name: ds.3.items.0
                      value: 'pf: Normalized packets per second'
                    - type: INTEGER
                      name: ds.3.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: PFMAL
                - type: item
                  name: 'Source nodes'
                  x: '12'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.srcnodes.current
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Rule evaluations/s'
                  x: '12'
                  'y': '6'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.rules.evaluations.rate
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: gauge
                  name: 'Source tracking'
                  x: '24'
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'Source tracking'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.srcnodes.pused
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: 'Table entries'
                  x: '24'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.tables.entries.used
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Blocked share of log'
                  x: '24'
                  'y': '6'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.fwlog.block.pct
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Filter rules'
                  x: '36'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.rules.filter.count
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'SYN floods/s'
                  x: '36'
                  'y': '6'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.synfloods.rate
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'State table searches'
                  x: '36'
                  'y': '9'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 8E24AA
                    - type: INTEGER
                      name: ds.0.fill
                      value: '2'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'pf: State table searches per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: PFSEA
                - type: svggraph
                  name: 'Drops and limit hits'
                  x: '36'
                  'y': '15'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'pf: Packets dropped for memory per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'pf: State limit hits per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: STRING
                      name: ds.2.color
                      value: FFD54F
                    - type: INTEGER
                      name: ds.2.fill
                      value: '0'
                    - type: STRING
                      name: ds.2.items.0
                      value: 'pf: Source limit hits per second'
                    - type: INTEGER
                      name: ds.2.width
                      value: '2'
                    - type: STRING
                      name: ds.3.color
                      value: 8E24AA
                    - type: INTEGER
                      name: ds.3.fill
                      value: '0'
                    - type: STRING
                      name: ds.3.items.0
                      value: 'pf: State mismatches per second'
                    - type: INTEGER
                      name: ds.3.width
                      value: '2'
                    - type: STRING
                      name: ds.4.color
                      value: 00897B
                    - type: INTEGER
                      name: ds.4.fill
                      value: '0'
                    - type: STRING
                      name: ds.4.items.0
                      value: 'pf: SYN floods detected per second'
                    - type: INTEGER
                      name: ds.4.width
                      value: '2'
                    - type: STRING
                      name: ds.5.color
                      value: '757575'
                    - type: INTEGER
                      name: ds.5.fill
                      value: '0'
                    - type: STRING
                      name: ds.5.items.0
                      value: 'pf: Overload table insertions per second'
                    - type: INTEGER
                      name: ds.5.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: PFDRP
                - type: gauge
                  name: 'Table entries'
                  x: '48'
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'Table entries'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.tables.entries.pused
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: 'NAT rules'
                  x: '48'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.rules.nat.count
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'State limit hits/s'
                  x: '48'
                  'y': '6'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.counter.statelimit.rate
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Rules never matched'
                  x: '60'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.rules.unused
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Source limit hits/s'
                  x: '60'
                  'y': '6'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.pf.counter.srclimit.rate
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
            - name: Interfaces
              widgets:
                - type: honeycomb
                  name: 'Link state'
                  width: '72'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'Interface *: Link status'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("Interface (.*): Link status", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IFLNK
                    - type: STRING
                      name: thresholds.0.color
                      value: E53935
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '1'
                - type: svggraph
                  name: Traffic
                  'y': '4'
                  width: '72'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: STRING
                      name: ds.0.items.0
                      value: 'Interface *: Bytes received'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'Interface *: Bytes transmitted'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IFTRF
                - type: svggraph
                  name: 'Blocked bytes IPv4'
                  'y': '10'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: '*blocked bytes INv4'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: '*blocked bytes OUTv4'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IFBLK
                - type: svggraph
                  name: 'Errors and drops'
                  'y': '16'
                  width: '72'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'Interface *: Inbound errors'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'Interface *: output errors'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: STRING
                      name: ds.2.color
                      value: FFD54F
                    - type: INTEGER
                      name: ds.2.fill
                      value: '0'
                    - type: STRING
                      name: ds.2.items.0
                      value: 'Interface *: input queue drops'
                    - type: INTEGER
                      name: ds.2.width
                      value: '2'
                    - type: STRING
                      name: ds.3.color
                      value: 8E24AA
                    - type: INTEGER
                      name: ds.3.fill
                      value: '0'
                    - type: STRING
                      name: ds.3.items.0
                      value: 'Interface *: collisions'
                    - type: INTEGER
                      name: ds.3.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IFERR
                - type: svggraph
                  name: 'Passed bytes IPv4'
                  x: '36'
                  'y': '10'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: '*passed bytes INv4'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: '*passed bytes OUTv4'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IFPAS
            - name: Gateways
              widgets:
                - type: honeycomb
                  name: 'Gateway status'
                  width: '72'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'Gateway Status *'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("Gateway Status (.*)", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: GWYHC
                    - type: STRING
                      name: thresholds.0.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '1'
                    - type: STRING
                      name: thresholds.2.color
                      value: E53935
                    - type: STRING
                      name: thresholds.2.threshold
                      value: '4'
                - type: svggraph
                  name: 'Round trip time'
                  'y': '4'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'Gateway RTT *'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: GWRTT
                - type: svggraph
                  name: 'Round trip time deviation'
                  'y': '10'
                  width: '72'
                  height: '5'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 8E24AA
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'Gateway RTTd *'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: GWDEV
                - type: svggraph
                  name: 'Packet loss'
                  x: '36'
                  'y': '4'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'Gateway loss *'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: GWLOS
            - name: VPN
              widgets:
                - type: honeycomb
                  name: 'WireGuard peers'
                  width: '36'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'WireGuard peer *: status'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("WireGuard peer (.*): status", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: WGPHC
                - type: svggraph
                  name: 'WireGuard peer traffic'
                  'y': '4'
                  width: '72'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: STRING
                      name: ds.0.items.0
                      value: 'WireGuard peer *: bytes received per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'WireGuard peer *: bytes sent per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: WGTRF
                - type: honeycomb
                  name: OpenVPN
                  'y': '10'
                  width: '36'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'OpenVPN *: status'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("OpenVPN (.*): status", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: OVPNH
                - type: honeycomb
                  name: 'IPsec phase 1'
                  'y': '14'
                  width: '72'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: '* connected'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("(.*) connected", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IPSHC
                - type: svggraph
                  name: 'IPsec phase 1 traffic'
                  'y': '18'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: STRING
                      name: ds.0.items.0
                      value: '* bytes per second in'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: '* bytes per second out'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IPS1T
                - type: honeycomb
                  name: 'WireGuard instances'
                  x: '36'
                  width: '36'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'WireGuard instance *: status'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("WireGuard instance (.*): status", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: WGIHC
                - type: svggraph
                  name: 'OpenVPN traffic'
                  x: '36'
                  'y': '10'
                  width: '36'
                  height: '4'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: STRING
                      name: ds.0.items.0
                      value: 'OpenVPN *: bytes received per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'OpenVPN *: bytes sent per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: OVPNT
                - type: svggraph
                  name: 'IPsec phase 2 traffic'
                  x: '36'
                  'y': '18'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: STRING
                      name: ds.0.items.0
                      value: '* bytes-in per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: '* bytes-out per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IPSTR
            - name: System
              widgets:
                - type: gauge
                  name: Processor
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'CPU utilization'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.cpu.util
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: Uptime
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.system.uptime
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'Processor utilization'
                  'y': '6'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 2774A4
                    - type: STRING
                      name: ds.0.items.0
                      value: 'CPU: User time'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: STRING
                      name: ds.1.items.0
                      value: 'CPU: System time'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: STRING
                      name: ds.2.color
                      value: E53935
                    - type: STRING
                      name: ds.2.items.0
                      value: 'CPU: Interrupt time'
                    - type: INTEGER
                      name: ds.2.width
                      value: '2'
                    - type: STRING
                      name: ds.3.color
                      value: '757575'
                    - type: INTEGER
                      name: ds.3.fill
                      value: '0'
                    - type: STRING
                      name: ds.3.items.0
                      value: 'CPU: Utilization'
                    - type: INTEGER
                      name: ds.3.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: CPUUT
                - type: honeycomb
                  name: 'Temperature sensors'
                  'y': '12'
                  width: '36'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'Temperature *'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("Temperature (.*)", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: TEMPH
                    - type: STRING
                      name: thresholds.0.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '65'
                    - type: STRING
                      name: thresholds.2.color
                      value: E53935
                    - type: STRING
                      name: thresholds.2.threshold
                      value: '80'
                - type: item
                  name: Version
                  x: '12'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.version
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: gauge
                  name: Memory
                  x: '24'
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'Memory utilization'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.memory.util
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '80'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '90'
                    - type: STRING
                      name: units
                      value: '%'
                - type: item
                  name: Cores
                  x: '24'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.cpu.cores
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Configuration changed'
                  x: '36'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.config.changed
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'Load average'
                  x: '36'
                  'y': '6'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 069C56
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'CPU load'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'Load average (5 min)'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: STRING
                      name: ds.2.color
                      value: 8E24AA
                    - type: INTEGER
                      name: ds.2.fill
                      value: '0'
                    - type: STRING
                      name: ds.2.items.0
                      value: 'Load average (15 min)'
                    - type: INTEGER
                      name: ds.2.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: LOADA
                - type: honeycomb
                  name: 'Swap devices'
                  x: '36'
                  'y': '12'
                  width: '36'
                  height: '4'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'Swap *: utilization'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("Swap (.*): utilization", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '13'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: SWAPH
                    - type: STRING
                      name: thresholds.0.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '5'
                    - type: STRING
                      name: thresholds.2.color
                      value: E53935
                    - type: STRING
                      name: thresholds.2.threshold
                      value: '30'
                - type: gauge
                  name: 'Load per core'
                  x: '48'
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'Load per core'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.system.load.percore
                    - type: STRING
                      name: max
                      value: '4'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '1'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '2'
                - type: item
                  name: 'Load average 5 min'
                  x: '48'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.system.load.avg5
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Load average 15 min'
                  x: '60'
                  'y': '3'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.system.load.avg15
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
            - name: 'Kernel and protocols'
              widgets:
                - type: gauge
                  name: 'mbuf clusters'
                  width: '24'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'mbuf clusters'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.mbuf.cluster.pused
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '60'
                    - type: STRING
                      name: thresholds.1.color
                      value: E53935
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '80'
                    - type: STRING
                      name: units
                      value: '%'
                - type: svggraph
                  name: 'Kernel network memory'
                  'y': '3'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 2774A4
                    - type: STRING
                      name: ds.0.items.0
                      value: 'mbuf: Clusters in use'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: E53935
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'mbuf: Denied requests'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: MBUFG
                - type: svggraph
                  name: 'IP errors'
                  'y': '9'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'IP: Packets with a bad checksum per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'IP: Fragments dropped per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: STRING
                      name: ds.2.color
                      value: FFD54F
                    - type: INTEGER
                      name: ds.2.fill
                      value: '0'
                    - type: STRING
                      name: ds.2.items.0
                      value: 'IP: Packets discarded for lack of a route per second'
                    - type: INTEGER
                      name: ds.2.width
                      value: '2'
                    - type: STRING
                      name: ds.3.color
                      value: 8E24AA
                    - type: INTEGER
                      name: ds.3.fill
                      value: '0'
                    - type: STRING
                      name: ds.3.items.0
                      value: 'IP: Packets that cannot be forwarded per second'
                    - type: INTEGER
                      name: ds.3.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: IPERR
                - type: item
                  name: 'Clusters in use'
                  x: '24'
                  width: '16'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.mbuf.cluster.current
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'netisr queue drops per protocol'
                  x: '36'
                  'y': '3'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'netisr *: Queue drops'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '3'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: NETIS
                - type: svggraph
                  name: 'TCP errors'
                  x: '36'
                  'y': '9'
                  width: '36'
                  height: '6'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: E53935
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'TCP: Segments with a bad checksum per second'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: FFA000
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'TCP: Retransmitted segments per second'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: TCPER
                - type: item
                  name: 'Denied requests'
                  x: '40'
                  width: '16'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.mbuf.denied
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'netisr queue drops'
                  x: '56'
                  width: '16'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.netisr.queue.drops
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
            - name: 'Services, clock and power'
              widgets:
                - type: honeycomb
                  name: Services
                  width: '72'
                  height: '5'
                  fields:
                    - type: STRING
                      name: items.0
                      value: 'Service *: Running'
                    - type: STRING
                      name: primary_label
                      value: '{{ITEM.NAME}.regsub("Service (.*): Running", "\1")}'
                    - type: INTEGER
                      name: primary_label_size
                      value: '11'
                    - type: INTEGER
                      name: primary_label_size_type
                      value: '1'
                    - type: STRING
                      name: reference
                      value: SVCHC
                    - type: STRING
                      name: thresholds.0.color
                      value: E53935
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '1'
                - type: item
                  name: 'Clock synchronised'
                  'y': '5'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.ntp.synced
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: gauge
                  name: 'UPS battery'
                  'y': '8'
                  width: '18'
                  height: '3'
                  fields:
                    - type: STRING
                      name: description
                      value: 'UPS battery'
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: nut.battery.charge
                    - type: STRING
                      name: max
                      value: '100'
                    - type: STRING
                      name: min
                      value: '0'
                    - type: STRING
                      name: thresholds.0.color
                      value: E53935
                    - type: STRING
                      name: thresholds.0.threshold
                      value: '0'
                    - type: STRING
                      name: thresholds.1.color
                      value: FFD54F
                    - type: STRING
                      name: thresholds.1.threshold
                      value: '20'
                    - type: STRING
                      name: thresholds.2.color
                      value: 069C56
                    - type: STRING
                      name: thresholds.2.threshold
                      value: '50'
                    - type: STRING
                      name: units
                      value: '%'
                - type: svggraph
                  name: 'Clock offset'
                  'y': '11'
                  width: '36'
                  height: '5'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'NTP: Offset of the selected peer'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: NTPOF
                - type: item
                  name: 'Clock offset'
                  x: '12'
                  'y': '5'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.ntp.offset
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'UPS status'
                  x: '18'
                  'y': '8'
                  width: '18'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: nut.status
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: Stratum
                  x: '24'
                  'y': '5'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.ntp.stratum
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'Reachable peers'
                  x: '36'
                  'y': '5'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.ntp.peers.reachable
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'UPS load'
                  x: '36'
                  'y': '8'
                  width: '18'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: nut.battery.load
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: svggraph
                  name: 'UPS voltage'
                  x: '36'
                  'y': '11'
                  width: '36'
                  height: '5'
                  fields:
                    - type: STRING
                      name: ds.0.color
                      value: 2774A4
                    - type: INTEGER
                      name: ds.0.fill
                      value: '0'
                    - type: STRING
                      name: ds.0.items.0
                      value: 'UPS Input Voltage'
                    - type: INTEGER
                      name: ds.0.width
                      value: '2'
                    - type: STRING
                      name: ds.1.color
                      value: 069C56
                    - type: INTEGER
                      name: ds.1.fill
                      value: '0'
                    - type: STRING
                      name: ds.1.items.0
                      value: 'UPS Output Voltage'
                    - type: INTEGER
                      name: ds.1.width
                      value: '2'
                    - type: INTEGER
                      name: legend_lines
                      value: '2'
                    - type: INTEGER
                      name: legend_statistic
                      value: '1'
                    - type: STRING
                      name: reference
                      value: UPSVO
                - type: item
                  name: 'CARP demotion'
                  x: '48'
                  'y': '5'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.carp.demotion
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'UPS runtime'
                  x: '54'
                  'y': '8'
                  width: '18'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: nut.battery.runtime
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
                - type: item
                  name: 'CARP maintenance'
                  x: '60'
                  'y': '5'
                  width: '12'
                  height: '3'
                  fields:
                    - type: ITEM
                      name: itemid.0
                      value:
                        host: 'OPNsense by HTTP-JSON'
                        key: opns.carp.maintenance
                    - type: INTEGER
                      name: show.0
                      value: '2'
                    - type: INTEGER
                      name: show.1
                      value: '3'
      valuemaps:
        - uuid: aa2168da8124494d92bd987313c9cadd
          name: 'Enabled state'
          mappings:
            - value: '0'
              newvalue: 'No'
            - value: '1'
              newvalue: 'Yes'
        - uuid: 70832bd0366347e7ac2b898cace71fd2
          name: 'Link status'
          mappings:
            - value: '0'
              newvalue: Down
            - value: '1'
              newvalue: Up
        - uuid: 0861f9fc95264f1fa76390177d1e4633
          name: 'NTP sync state'
          mappings:
            - value: '0'
              newvalue: 'Not synchronised'
            - value: '1'
              newvalue: Synchronised
        - uuid: 55a425ac89ff41459fa46bb48694fa0c
          name: 'Service state'
          mappings:
            - value: '0'
              newvalue: Stopped
            - value: '1'
              newvalue: Running
  triggers:
    - uuid: 6003bfd5a8f44a6d9a04f08de932fef1
      expression: 'find(/OPNsense by HTTP-JSON/opns.firmware.update.status,#1,"regexp","^(update|upgrade)$")=1 and last(/OPNsense by HTTP-JSON/opns.firmware.update.count)>0'
      name: 'OPNsense firmware updates are available'
      event_name: 'OPNsense firmware updates are available ({ITEM.LASTVALUE})'
      opdata: 'Updates: {ITEM.LASTVALUE2}'
      priority: INFO
      description: 'A firmware update or major upgrade is available.'
