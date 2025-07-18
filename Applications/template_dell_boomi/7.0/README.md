# Boomi JMX Monitoring Template

## Overview

This template provides comprehensive monitoring for Dell Boomi runtime environments (Atoms, Molecules, and Clouds) using Java Management Extensions (JMX). It monitors all critical aspects of Boomi runtime performance, health, and resource utilization.

## Requirements

- Zabbix version: 7.0+
- JMX interface enabled on Boomi runtime
- Network connectivity from Zabbix server/proxy to Boomi runtime JMX port

## Supported Versions

- Boomi Runtime: All current versions supporting JMX monitoring
- Tested with Atom, Molecule, and Cloud runtime types

## Configuration

### 1. Enable JMX on Boomi Runtime

Before using this template, you must enable remote JMX monitoring on your Boomi runtime. Follow the official Boomi documentation:
[Enabling remote JMX on a runtime](https://help.boomi.com/docs/Atomsphere/Integration/Integration%20management/t-atm-Enabling_remote_JMX_on_an_Atom_1a1625d0-330d-43c6-a765-42502d7768ec)

### 2. Template Installation

1. Import the template file `zbx_export_templates.yaml` into your Zabbix server
2. Create or modify a host for your Boomi runtime
3. Assign the "Boomi JMX" template to the host
4. Configure the JMX interface on the host:
   - **IP address**: Your Boomi runtime server IP
   - **Port**: JMX port (typically 9999 or as configured)
   - **Use custom username**: Yes
   - **User name**: Your JMX username
   - **Password**: Your JMX password

### 3. Template Macros

The template uses the following macros that must be configured:

| Macro | Description | Default Value |
|-------|-------------|---------------|
| `{$JMX.USER}` | JMX username for authentication | (no default) |
| `{$JMX.PASSWORD}` | JMX password for authentication | (no default) |

**Note**: The `{$JMX.PASSWORD}` macro is configured as `SECRET_TEXT` for security.

## Monitored Metrics

### JGroups 3.x Clustering
- Number of message bytes received/sent
- Number of messages received/sent
- Cluster communication health

### Runtime Status & Configuration
- Runtime status (RUNNING, INITIALIZING, PAUSED, etc.)
- Number of attached accounts
- Clustering problems detection
- Decommission stage monitoring
- Head node identification
- Restart status monitoring

### Execution Management
- Average queue wait time
- Average execution time
- Running executions (local and estimated)
- Queued executions (current and estimated)
- Maximum execution limits
- Total execution counts

### Message Processing
- **Incoming Messages**:
  - Downloaded message count
  - Download failure count
- **Outgoing Messages**:
  - Upload message counts (disabled by default)
  - Upload failure counts (disabled by default)
  - Pending message counts (disabled by default)

### Resource Management
- Low memory status detection
- Out of Memory Error (OOME) detection
- Runtime queue server health
- Memory and disk usage limits

### Queue Server Monitoring
- Local and total queue counts
- Dead letter message monitoring
- Overall service health status
- Memory allocation settings
- Disk usage monitoring
- Thread pool configuration

### Web Services (Jetty)
- Thread pool size
- Queue size for incoming requests
- Performance monitoring

### Apache ActiveMQ Broker
- Memory usage percentage
- Message store disk usage
- Temporary store disk usage
- Job scheduler store usage

### Worker Management
- Local execution worker counts
- Total cluster execution workers
- Browser worker counts

## Monitoring Categories

The template organizes metrics into logical categories using tags:

- **boomi**: Core Boomi runtime metrics
- **JGroups 3.x**: Cluster communication
- **runtime**: Runtime status and configuration
- **execution**: Process execution metrics
- **incoming**: Inbound message processing
- **outgoing**: Outbound message processing
- **jetty**: Web service performance
- **apache-amq**: Message broker metrics

## Key Monitoring Points

### Critical Metrics to Watch

1. **Runtime Status**: Monitor for unexpected status changes
2. **Clustering Problems**: Alert on any clustering issues
3. **Memory Issues**: Watch for low memory or OOME conditions
4. **Queue Wait Times**: Monitor for performance degradation
5. **Message Failures**: Alert on upload/download failures
6. **Dead Letter Messages**: Monitor for stuck messages

### Trend Analysis

Many metrics should be monitored over time to establish baselines:
- Execution counts and timing
- Message throughput
- Resource utilization
- Queue depths

## Disabled Items

Some items are disabled by default and require queue-specific configuration:
- Message queue metrics with `<queueName>` placeholders
- Upload statistics for specific queues

To enable these items:
1. Navigate to the template items
2. Find items with `status: DISABLED`
3. Enable and configure with appropriate queue names

## Troubleshooting

### Common Issues

1. **JMX Connection Failed**
   - Verify JMX is enabled on Boomi runtime
   - Check network connectivity and firewall rules
   - Validate JMX credentials

2. **Some Metrics Not Available**
   - Certain metrics are only available on head nodes in clusters
   - Some metrics require specific Boomi runtime features to be enabled

3. **Authentication Issues**
   - Ensure JMX credentials are correctly configured
   - Check that the JMX user has appropriate permissions

## References

- [Boomi JMX System Monitoring Documentation](https://help.boomi.com/docs/Atomsphere/Integration/Integration%20management/r-atm-System_monitoring_with_JMX_3c582f4e-29ce-4cd4-a246-be25bd36b583)
- [Boomi Runtime Monitoring Guide](https://help.boomi.com/docs/Atomsphere/Integration/Integration%20management/c-atm-Monitoring_Atoms_Molecules_and_Clouds_6dfed5a6-6d42-4913-9042-5593d44db5ea)

## License

This template is provided under the same license terms as other Zabbix community templates.

## Contributing

To contribute improvements or report issues:
1. Fork the community templates repository
2. Make your changes
3. Submit a pull request with detailed description

## Author

Template created based on official Dell Boomi JMX monitoring documentation.

## Version History

- **1.0**: Initial release with comprehensive Boomi JMX monitoring
  - 58+ monitoring items covering all major Boomi runtime aspects
  - Proper security implementation with SECRET_TEXT macro
  - Organized tagging for easy metric filtering
  - Based on official Boomi documentation
