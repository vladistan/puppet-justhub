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

}
