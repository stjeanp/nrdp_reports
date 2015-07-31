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
}
