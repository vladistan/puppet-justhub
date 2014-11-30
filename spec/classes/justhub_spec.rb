require 'spec_helper'

describe 'justhub' do

    let(:facts) {
      {:osfamily => 'RedHat',}
    }

    let(:params) { {
      :enabled     => ['justhub'],
      :baseurl     => 'http://sherkin.justhub.org/el5/RPMS/x86_64/',
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
      should contain_repoforge__yumrepo('justhub').with({
         'repos'       => {"extras"=>"rpmforge-extras","rpmforge"=>"rpmforge","testing"=>"rpmforge-testing"},
         'baseurl'     => 'http://apt.sw.be/redhat/el6/en/i386',
         'enabled'     => ['justhub'],
       })
    end

end
