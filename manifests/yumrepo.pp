# define: justhub::yumrepo
#
#  The actual report configuration
#
# Parameters:
# [*enabled*]
#   An array of repository names to be enabled.  Default is ['rpmforge'].
#
# [*baseurl*]
#   The root of the repository baseurl parameter.  Default points to the main
#   Justhub mirror; override this if you want to specify a different mirror.
#
# [*mirrorlist*]
#   The root of the repository mirrorlist parameter.  Default points to the
#   mirrorlist file on the main Justhub mirror; override this if you want to
#   specify a different mirrorlist file.
#
# [*repos*]
#   Array of repositories to declare
#
# Actions:
#
# Requires:
# [*stdlib*]
#
# Sample Usage:
#    justhub::yumrepo {
#      justhub::repolist:
#        require    => justhub::Rpm_gpg_key['RPM-GPG-KEY-justhub-mail'],
#        repos      => justhub::params::repos,
#        baseurl    => justhub::baseurl,
#        mirrorlist => justhub::mirrorlist,
#        enabled    => justhub::enabled;
#    }
#
define justhub::yumrepo (
  $reponame,
  $enabled,
) {

  validate_array($enabled)


  yumrepo {
    $reponame :
      descr       => "el${::os_maj_version} - justhub.org - CD",
      baseurl     => "http://sherkin.justhub.org/el${::os_maj_version}",
      enabled     => bool2num(member($enabled,"justhub")),
      protect     => 0,
      gpgcheck    => 1,
      gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-justhub-mail',
  }
}
