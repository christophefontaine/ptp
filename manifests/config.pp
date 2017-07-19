# This class handles ptp configuration files

class ptp::config inherits ptp {

  if $ptp::timemaster_service_manage == true {

    file { $ptp::timemaster_conffile:
      ensure => file,
      owner => 0,
      group => 0,
      mode => '0644',
      content => epp('ptp/timemaster.conf.epp')
    }

  }
  else {

    file { "ptp4l-${ptp::ptp4l_interface}.conf":
      ensure => file,
      owner => 0,
      group => 0,
      mode => '0644',
      path => $ptp::ptp4l_confpath
      content => epp('ptp/ptp4l.conf.epp'),
    }

    file { "ptp4l@.service":
      ensure => file,
      owner => 0,
      group => 0,
      mode => '0644',
      path => $ptp::ptp4l_service_confpath
      content => epp('ptp/ptp4l.service.epp'),
    }

    file { $ptp::phc2sys_optfile:
      ensure => file,
      owner => 0,
      group => 0,
      mode => '0644',
      content => epp('ptp/phc2sys.epp'),
    }

  }

}
