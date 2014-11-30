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
  $baseurl    = $justhub::params::baseurl,
  $mirrorlist = $justhub::params::mirrorlist,
  $includepkgs = {},
  $exclude = {},
) inherits justhub::params {

  validate_array($justhub::enabled)
  validate_string($justhub::baseurl,$repoforge::mirrorlist)

  if $::osfamily == 'RedHat' {

    justhub::rpm_gpg_key { 'RPM-GPG-KEY-justhub-mail' :
              path => '/etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
}
  } else {
    notice ("Your operating system ${::operatingsystem} will not have the RepoForge repository applied")
  }

}
