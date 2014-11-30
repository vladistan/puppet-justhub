# spec/defines/yumrepo_spec.rb

require 'spec_helper'

describe 'justhub::yumrepo' do
  
  let(:title) { 'justhub' }

  let(:params) { {
    :enabled => ['justhub'],
    :reponame => 'justhub'
  } }

  let(:facts) { {
      :os_maj_version => 5,
  } }
 
  it 'set yum repository'  do
    should contain_yumrepo('justhub').with({
      'descr'       => 'el5 - justhub.org - CD',
      'baseurl'     => 'http://sherkin.justhub.org/el5',
      'protect'     => 0,
      'gpgcheck'    => 1,
      'gpgkey'      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
    })
  end

end


describe 'justhub::yumrepo' do

  let(:title) { 'justhub' }

  let(:params) { {
      :enabled => ['justhub'],
      :reponame => 'justhub'
  } }

  let(:facts) { {
      :os_maj_version => 6,
  } }

  it 'set yum repository'  do
    should contain_yumrepo('justhub').with({
       'descr'       => 'el6 - justhub.org - CD',
       'baseurl'     => 'http://sherkin.justhub.org/el6',
       'protect'     => 0,
       'gpgcheck'    => 1,
       'gpgkey'      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
  })
  end

end
