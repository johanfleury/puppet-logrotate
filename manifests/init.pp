# Class: logrotate
class logrotate (
  String $package_name = $logrotate::params::package_name,
  String $package_ensure = $logrotate::params::package_ensure,

  Boolean $cron_manage = $logrotate::params::cron_manage,
  Pattern[/(hourly|daily|weekly|monthly)/] $cron_period = $logrotate::params::cron_period,

  Stdlib::AbsolutePath $config_file = $logrotate::params::config_file,
  Stdlib::AbsolutePath $config_dir = $logrotate::params::config_dir,
  Boolean $purge_config_dir = $logrotate::params::purge_config_dir,

  Hash $global_settings = $logrotate::params::global_settings,
  Hash $rules = {},
) inherits logrotate::params {
  contain ::logrotate::install
  contain ::logrotate::config
  contain ::logrotate::cron

  Class['::logrotate::install']
  -> Class['::logrotate::config']
  -> Class['::logrotate::cron']
}
