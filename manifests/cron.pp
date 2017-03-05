# Class: logrotate::cron
class logrotate::cron {
  assert_private()

  $cron_period = $::logrotate::cron_period

  if $cron_period != 'daily' {
    file { '/etc/cron.daily/logrotate':
      ensure => absent,
    }
  }

  file { "/etc/cron.${cron_period}/logrotate":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/logrotate/logrotate.cron',
  }
}
