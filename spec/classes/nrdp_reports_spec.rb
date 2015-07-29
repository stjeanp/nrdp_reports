require 'spec_helper'

describe 'nrdp_reports', :type => :class do
  context 'default' do
    let(:facts) { { :puppetversion => '3.7.5'} }
    it { should contain_class('nrdp_reports') }
    it { should contain_class('nrdp_reports::params') }
    it { should contain_file('nrdp_reports-yaml-config').with(:owner => 'puppet') }
  end

  context 'pe' do
    let(:facts) { { :is_pe => true } }
    it { should contain_class('nrdp_reports') }
    it { should contain_class('nrdp_reports::params') }
    it { should contain_file('nrdp_reports-yaml-config').with(:owner => 'pe-puppet') }
  end

  context 'puppet 4' do
    let(:facts) { { :puppetversion => '4.0.0', :is_pe => false } }
    it { should contain_class('nrdp_reports') }
    it { should contain_class('nrdp_reports::params') }
    it { should contain_file('nrdp_reports-yaml-config').with(:owner => 'puppet') }
  end
end
