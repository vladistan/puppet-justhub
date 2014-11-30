# spec/defines/rpm_gpg_key.pp

require 'spec_helper'

describe 'justhub::rpm_gpg_key' do

  let(:title) {'RPM-GPG-KEY-justhub-mail'}

  let(:params) { {
    'name' => 'RPM-GPG-KEY-justhub-mail',
    'path' => '/etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
  } }

  it 'imports the gpg key into rpm' do
    should contain_exec('import-RPM-GPG-KEY-justhub-mail').with({
        'command' => 'rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
       # 'unless'  => "rpm -q gpg-pubkey-`$(echo $(gpg --throw-keyids < /etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail) | cut --characters=11-18 | tr [A-Z] [a-z])`",
    })
  end

end
