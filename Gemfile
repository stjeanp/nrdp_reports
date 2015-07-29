source ENV['GEM_SOURCE'] || "https://rubygems.org"

gem 'nagios_nrdp', '>= 0.0.1'

group :development, :test do
  gem 'rake', '~> 10.4', :require => false
  gem 'puppetlabs_spec_helper'
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'metadata-json-lint'
  gem 'puppet-lint',             :require => false
  gem 'rubocop', '~> 0.30', :require => false
  #gem 'rspec', '~> 3.3', :require => false
  #gem 'rspec-core', '~> 3.3', :require => false
  #gem 'webmock', '~> 1.21', :require => false
  #gem 'jeweler', '~> 2.0', :require => false
  #gem 'coveralls', '~> 0.8', :require => false
  #gem 'yard', '~> 0.8', :require => false
end

#group :test do
#  gem 'rake', '>= 10.0.0'
#  gem 'rspec-puppet-facts'
#end

#group :development do
#  gem 'travis'
#  gem 'travis-lint'
#  gem 'guard-rake'
#  gem 'rubocop', require: false
#  gem 'pry'
#  gem 'librarian-puppet'
#end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', '>= 3.8.0', '< 3.9.0', :require => false
end
