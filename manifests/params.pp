# Class: justhub::params
#
#  The justhub configuration settings
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class justhub::params {

  $baseurl = "http://sherkin.justhub.org/el${::os_maj_version}/"
  $enabled = [ 'justhub' ]

}
