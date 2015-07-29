class { 'nrdp_reports':
  nrdp_url => 'http://nagios.example.com/nrdp'
  nrdp_token => 'something'
  check_service => 'service name'
}
