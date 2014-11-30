# Class: justhub
#
# This ensures justhub repo is installed
#
# Parameters: none
#
# Actions:
#
# Requires: 
# [*stdlib*]
#
# Sample Usage:
#
class justhub (
  $enabled    = $justhub::params::enabled,
  ) inherits justhub::params {

  include stdlib

  validate_array($justhub::enabled)
  validate_string($justhub::baseurl)

  if $::osfamily == 'RedHat' {


    justhub::yumrepo {
        "justhub" :
        reponame    => 'justhub',
        require     => Justhub::Rpm_gpg_key['RPM-GPG-KEY-justhub-mail'],
        enabled     => $justhub::enabled,
    }

    file {'/etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail' :
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/justhub/RPM-GPG-KEY-justhub-mail',
    }


    justhub::rpm_gpg_key { 'RPM-GPG-KEY-justhub-mail' :
              path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
    }



  } else {
    notice ("Your operating system ${::operatingsystem} will not have the RepoForge repository applied")
  }

}
