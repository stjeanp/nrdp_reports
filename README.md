#Nagios NRDP Reports Puppet module

####Table of Contents

1. [Overview](#overview)
2. [Module description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the Logstash Reporter](#setup)
  * [The module manages the following](#the-module-manages-the-following)
  * [Requirements](#requirements)
4. [Usage - Configuration options and additional functionality](#usage)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
8. [Support - When you need help with this module](#support)
9. [Credits](#credits)



##Overview

This module manages the NRDP reporter which sends reports of catalog runs with changes or that have failed to the configured Nagios server.

##Module description

The nrdp_reports module sets up and configures the reporter

##Setup

###The module manages the following

* reporter configuration file.

###Requirements

* `nagios_nrdp`
* Master puppet.conf needs to use the NRDP reporter. 
```
[master]
report = true
reports = nrdp
pluginsync = true
```
* Agent puppet.conf needs to send the reports to master. 
```
[agent]
report = true
pluginsync = true
```

##Usage

###Main class

####Basic usage

```puppet
class { 'nrdp_reports':
  nrdp_url      => 'http://nagios.example.com/nrdp'
  nrdp_token    => 'something'
  check_service => 'service name'
}
```

####Parameters

##### `nrdp_url`
*Required.* Specifies the URL of the NRDP endpoint to use.
Default: undef.

##### `nrdp_token`
*Required.* Specifies the token to use to authenticate with the NRDP endpoint.
Default: undef.

##### `alert_on_fail`
Should an alert be sent if a catalog run fails?
Default: true.

##### `alert_on_change`
Should an alert be sent if a catalog run has changes?
Default: true.

##### `check_service`
*Required.* The name of the Nagios service that will be used.
Default: undef.

##### `fail_state`
The state to use for failed runs.
Valid options: 0 (OK), 1 (WARNING), 2 (CRITICAL), 3 (UNKNOWN)
Default: 2

##### `change_state`
The state to use for runs with changes.
Valid options: 0 (OK), 1 (WARNING), 2 (CRITICAL), 3 (UNKNOWN)
Default: 1

##Limitations

This module has been built on and tested against Puppet 3.8 and higher.

The module has been tested on:

* CentOS 7

Other distro's that have been reported to work:

* RHEL 7

Testing on other platforms has been light and cannot be guaranteed.

##Development

##Support

##Credits
