# = Class: nrdp_reports::params
#
# The parameters and their defaults for the NRDP puppet report processor

class nrdp_reports::params {
  $nrdp_url        = undef
  $nrdp_token      = undef
  $alert_on_fail   = true
  $alert_on_change = true
  $check_service   = undef
  $fail_state      = 2
  $change_state    = 1

  if str2bool($::is_pe) {
    $puppet_user    = 'pe-puppet'
    $puppet_confdir = '/etc/puppetlabs/puppet'
    $gem_provider   = 'pe_gem'
  } else {
    $puppet_user    = 'puppet'
    $puppet_confdir = '/etc/puppet'
    $gem_provider   = 'gem'
  }
}

