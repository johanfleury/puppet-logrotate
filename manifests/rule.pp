# Defined type: logrotate::rule
define logrotate::rule (
  Stdlib::AbsolutePath $filename = "${::logrotate::config_dir}/${title}",
  String $template = 'logrotate/rule.conf.erb',
  Optional[Array[String]] $paths = undef,

  Optional[Pattern[/(hourly|daily|weekly|monthly)/]] $rotate_period = undef,
  Optional[Boolean] $compress = undef,
  Optional[String] $compresscmd = undef,
  Optional[String] $uncompresscmd = undef,
  Optional[String] $compressext = undef,
  Optional[String] $compressoptions = undef,
  Optional[Boolean] $copy = undef,
  Optional[Boolean] $copytruncate = undef,
  Optional[Boolean] $create = undef,
  Optional[String] $create_mode = undef,
  Optional[String] $create_owner = undef,
  Optional[String] $create_group = undef,
  Optional[Boolean] $createolddir = undef,
  Optional[String] $createolddir_mode = undef,
  Optional[String] $createolddir_owner = undef,
  Optional[String] $createolddir_group = undef,
  Optional[Boolean] $dateext = undef,
  Optional[String] $dateformat = undef,
  Optional[Boolean] $dateyesterday = undef,
  Optional[Boolean] $delaycompress = undef,
  Optional[String] $extension = undef,
  Optional[String] $addextension = undef,
  Optional[Boolean] $ifempty = undef,
  Optional[String] $include = undef,
  Optional[String] $mail = undef,
  Optional[String] $mailfirst = undef,
  Optional[String] $maillast = undef,
  Optional[Integer] $minage = undef,
  Optional[Integer] $maxage = undef,
  Optional[Integer] $maxsize = undef,
  Optional[Integer] $minsize = undef,
  Optional[Boolean] $missingok = undef,
  Optional[String] $olddir = undef,
  Optional[Array[String]] $postrotate = undef,
  Optional[Array[String]] $prerotate = undef,
  Optional[Array[String]] $firstaction = undef,
  Optional[Array[String]] $lastaction = undef,
  Optional[Array[String]] $preremove = undef,
  Optional[Integer] $rotate = undef,
  Optional[Boolean] $renamecopy = undef,
  Optional[Integer] $size = undef,
  Optional[Boolean] $sharedscripts = undef,
  Optional[Boolean] $shred = undef,
  Optional[Integer] $shredcycles = undef,
  Optional[Integer] $start = undef,
  Optional[Boolean] $su = undef,
  Optional[String] $su_user = undef,
  Optional[String] $su_group = undef,
) {
  $create_options = strip("${create_mode} ${create_owner} ${create_group}")

  $createolddir_options = strip(
    "${createolddir_mode} ${createolddir_owner} ${createolddir_group}"
  )

  $su_options = strip("${su_user} ${su_group}")

  file { $filename:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($template),
  }
}
