# = Class: nrdp_reports
#
# A puppet report processor that sends a passive check notification to Nagios using NRDP when a catalog run fails or has changes.
#
# This class installs and sets up the report processor on your Puppet Master.
#
# == Actions:
#   - template nrdp_reports.yaml configuration file
#
# === Parameters:
#
# [*nrdp_url*]
#   (string) The URL of the NRDP endpoint
#   (default: undef)
#   Example: http://localhost/nrdp
#
# [*nrdp_token*]
#   (string) The authentication token to use
#   (default: undef)
#
# [*alert_on_fail*]
#   (boolean) Do we send an alert on a failed run?
#   (default: true)
#
# [*alert_on_change*]
#   (string) Do we send an alert when a run has changes?
#   (default: true)
#
# [*check_service*]
#   (string) The service name to submit the passive check for
#   (default: undef)
#
# [*fail_state*]
#   (integer) The Nagios state for a failed run
#   (default: 2 <critical>)
#
# [*change_state*]
#   (integer) The Nagios state for a run with changes
#   (default: 1 <warning>)
#
# == Sample Usage:
#
#    class { 'nrdp_reports':
#      nrdp_url  => 'http://nagios.example.com/nrdp',
#      nrdp_token  => 'something_more_secure',
#      alert_on_change  => false,
#      check_service => 'Puppet Catalog',
#    }
#

class nrdp_reports (
  $nrdp_url        = $nrdp_reports::params::nrdp_url,
  $nrdp_token      = $nrdp_reports::params::nrdp_token,
  $alert_on_fail   = $nrdp_reports::params::alert_on_fail,
  $alert_on_change = $nrdp_reports::params::alert_on_change,
  $check_service   = $nrdp_reports::params::check_service,
  $fail_state      = $nrdp_reports::params::fail_state,
  $change_state    = $nrdp_reports::params::change_state,
) inherits nrdp_reports::params {

  validate_string($nrdp_url)
  validate_string($nrdp_token)
  validate_bool($alert_on_fail)
  validate_bool($alert_on_change)
  validate_string($check_service)
  validate_integer($fail_state)
  validate_integer($change_state)

  package {'nagios_nrdp':
    ensure   => latest,
    provider => 'puppet_gem',
  }

  file {'nrdp_reports-yaml-config':
    ensure  => present,
    path    => "${::puppet_confdir}/nrdp_reports.yaml",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template("${module_name}/nrdp_reports.yaml.erb"),
  }
}
