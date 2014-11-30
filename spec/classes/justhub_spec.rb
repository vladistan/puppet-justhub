require 'spec_helper'

describe 'justhub' do

    let(:facts) {
      {:osfamily => 'RedHat',}
    }

    let(:params) { {
      :enabled     => ['justhub'],
    } }

    it 'create the GPG key file' do
      should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail').with({
        'ensure' => 'present',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644',
        'source' => 'puppet:///modules/justhub/RPM-GPG-KEY-justhub-mail',
      })
    end

    it 'import the GPG key' do
      should contain_justhub__rpm_gpg_key('RPM-GPG-KEY-justhub-mail').with({
        'path' => '/etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
      })
    end

    it 'instantiate the yum repos' do
      should contain_justhub__yumrepo('justhub').with({
         'enabled'     => ['justhub'],
       })
    end

end
