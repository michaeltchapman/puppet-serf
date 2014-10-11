class serf::config (
  $encrypt_key,
  $rpc_auth,

  $config_owner            = $::serf::params::config_owner,
  $config_group            = $::serf::params::config_group,
  $config_file             = $::serf::params::config_file,
  $config_file_mode        = $::serf::params::config_file_mode,
  $config_dir              = $::serf::params::config_dir,
  $config_dir_mode         = $::serf::params::config_dir_mode

  # Serf Configuration Options
  $node_name               = $::serf::params::node_name,
  $tags                    = $::serf::params::tags,
  $tags_file               = undef,
  $bind                    = $::serf::params::bind,
  $interface               = undef,
  $advertise               = undef,
  $discover                = undef,
  $log_level               = undef,
  $profile                 = undef
  $protocol                = undef,
  $rpc_addr                = undef,
  $event_handlers          = []
  $start_join              = undef,
  $replay_on_join          = $::serf::params::replay_on_join,
  $snapshot_path           = $::serf::params::snapshot_path,
  $leave_on_terminate      = undef,
  $skip_leave_on_interrupt = undef,
  $reconnect_interval      = undef,
  $reconnect_timeout       = undef,
  $tombstone_timeout       = undef,
  $disable_name_resolution = undef,
  $enable_syslog           = true,
  $syslog_facility         = undef,
  $retry_join              = $::serf::params::retry_join,
  $retry_max_attempts      = undef,
  $retry_interval          = undef,
  $rejoin_after_leave      = undef,
  $statsite_addr           = undef
) inherits serf::params
{
  if $keyring_file and $encrypt {
    fail('serf::config: keyring file and encrypt are mutually exclusive')
  }

  File {
    owner  => $config_owner,
    group  => $config_group,
    notify => Service['serf'],
  }

  file { $config_dir:
    ensure => $directory,
    mode   => $config_dir_mode;
  }

  file { $config_file:
    ensure  => present,
    content => template('serf/config.json.erb');
    mode   => $config_file_mode,
  }
}
