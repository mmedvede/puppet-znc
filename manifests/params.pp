# Class: znc::params
#
# Description
#   This class is designed to carry default parameters for
#   Class: znc.
#
# Parameters:
#   $zc_packages  - List of packages required to install ZNC
#   $zc_auth_type - Default auth type if not configured
#   $zc_ssl       - Default SSL status if not configured
#   $zc_port      - Default port if not configured
#   $zc_ipv6:     - Default IPv6 (enabled)
#
# Actions:
#   This module does not perform any actions.
#
# Requires:
#   This module has no requirements.
#
# Sample Usage:
#   This method should not be called directly.
class znc::params {
  case $::operatingsystem {
    redhat,fedora,centos: {
      $zc_suffix = 'redhat'
      $zc_packages = ['znc', 'znc-modtcl', 'znc-modperl']
      case $::operatingsystemmajrelease {
        7: {
          $systemd = true
        }
        default: {
          $systemd = false
        }
      }
    }
    ubuntu, debian: {
      $zc_suffix = 'debian'
      $zc_packages = [ 'znc', 'znc-tcl', 'znc-perl' ]
      case $::operatingsystemmajrelease {
        8: {
          $systemd = true
        }
        default: {
          $systemd = true
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }

  $max_buffer_size = 500

# server definition
  $zc_user       = 'znc'
  $zc_group      = 'znc'
  $zc_uid        = '400'
  $zc_gid        = '400'
  $zc_config_dir = '/etc/znc'
  $zc_auth_type  = 'plain'
  $zc_ssl        = true
  $zc_port       = '7777'
  $zc_ipv6       = true
}
