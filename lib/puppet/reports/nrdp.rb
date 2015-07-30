require 'puppet'

begin
  require 'nagios_nrdp'
rescue LoadError => _e
  Puppet.info 'You need to install the `nagios_nrdp` gem first!'
end

unless Puppet.version >= '3.0.0'
  fail 'This report processor requires Puppet version 3.0.0 or later'
end

Puppet::Reports.register_report(:nrdp) do
  configfile = File.join([File.dirname(Puppet.settings[:config]), 'nrdp_reports.yaml'])
  unless File.exist?(configfile)
    fail Puppet::ParseError, "NRDP report config file #{configfile} missing or not readable!"
  end
  CONFIG = YAML.load_file(configfile)

  desc <<-DESC
  Report catalog runs that failed or had changes to Nagios using NRDP.
  DESC

  def process
    output = 'Puppet catalog run '
    case status
    when 'failed'
      return true unless CONFIG[:alert_on_fail]
      output += 'failed!'
      state = CONFIG[:fail_state]
    when 'changed'
      return true unless CONFIG[:alert_on_change]
      output += 'had changes.'
      state = CONFIG[:change_state]
    else
      return true
    end

    begin
      nrdp = Nagios::Nrdp.new(url: CONFIG[:nrdp_url],
                              token: CONFIG[:nrdp_token])

      nrdp.submit_check(hostname: host,
                        servicename: CONFIG[:check_service],
                        state: state,
                        output: output)
    rescue => e
      Puppet.err("Failed to send NRDP report: #{e.message}")
    end
  end
end
