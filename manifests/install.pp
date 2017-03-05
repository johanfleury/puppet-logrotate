# Class: logrotate::install
class logrotate::install {
  assert_private()

  package { $::logrotate::package_name:
    ensure => $::logrotate::package_ensure,
  }
}
