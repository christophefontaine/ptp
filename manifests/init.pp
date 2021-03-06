# Class: ptp
# ===========================
#
# Full description of class ptp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ptp':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ptp (
  Boolean $package_manage,
  String $package_name,
  String $package_ensure,
  String $ptp4l_confpath,
  String $ptp4l_service_confpath,

  String $ptp4l_default_service_name,
  String $ptp4l_service_ensure,
  Boolean $ptp4l_service_enable,
  Boolean $ptp4l_service_manage,

  String $phc2sys_default_service_name,
  String $phc2sys_service_ensure,
  Boolean $phc2sys_service_enable,
  Boolean $phc2sys_service_manage,

  String $phc2sys_opt_confpath,
  String $phc2sys_service_confpath,
  String $phc2sys_options,

  String $timemaster_service_name,
  String $timemaster_service_ensure,
  Boolean $timemaster_service_enable,
  Boolean $timemaster_service_manage,

  String $timemaster_conffile,
  String $timemaster_ntp_program,
  Optional[String] $timemaster_chronyd_options,
  String $timemaster_ntp_server,
  Integer $timemaster_ntp_server_minpoll,
  Integer $timemaster_ntp_server_maxpoll,
  Optional[String] $timemaster_ntpd_options,
  String $timemaster_ptp4l_interface,
  Optional[String] $timemaster_ptp4l_options,
  Optional[String] $timemaster_phc2sys_options,
) {

  contain ptp::install
  contain ptp::config
  contain ptp::service

  Class['::ptp::install'] ->
  Class['::ptp::config'] ~>
  Class['::ptp::service']
}
