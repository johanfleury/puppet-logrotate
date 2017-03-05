# Class: logrotate::config
class logrotate::config inherits logrotate {
  assert_private()

  $global_settings_defaults = {
    filename => $::logrotate::config_file,
    template => 'logrotate/logrotate.conf.erb',
    include  => $::logrotate::config_dir,
  }

  create_resources(
    '::logrotate::rule',
    { 'global' => $::logrotate::global_settings }, $global_settings_defaults
  )

  file { $::logrotate::config_dir:
    ensure  => directory,
    purge   => $::logrotate::purge_config_dir,
    recurse => $::logrotate::purge_config_dir,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
  }

  logrotate::rule { 'wtmp':
    paths         => [
      '/var/log/wtmp',
      '/var/log/btmp',
    ],
    rotate_period => 'monthly',
    create        => true,
    create_mode   => '0660',
    create_owner  => 'root',
    create_group  => 'utmp',
    missingok     => true,
    rotate        => 1,
    require       => File[$::logrotate::config_dir],
  }

  $rules_defaults = {
    require => File[$::logrotate::config_dir],
  }

  create_resources('::logrotate::rule', $::logrotate::rules, $rules_defaults)
}
