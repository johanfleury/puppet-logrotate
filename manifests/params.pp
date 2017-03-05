# Class: logrotate::params
class logrotate::params {
  $package_name = 'logrotate'
  $package_ensure = 'installed'

  $cron_manage = true
  $cron_period = 'daily'

  $config_file = '/etc/logrotate.conf'
  $config_dir = '/etc/logrotate.d'
  $purge_config_dir = true

  $global_settings = {
    rotate_period => 'weekly',
    rotate        => 4,
    create        => true,
    compress      => true,
  }
}
