class serf (
  $manage_firewall = true,
  $version         = $serf::params::verion
) inherits serf::params
{
  include serf::install
  include serf::config
  include serf::service

  if $manage_firewall {
    include serf::firewall
    Class['serf::firewall'] -> Class['serf::service']
  }

  Class['serf::install'] ->
  Class['serf::config'] ~>
  Class['serf::service']
}
