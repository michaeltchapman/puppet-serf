class serf::service(
  $service_name = $::serf::params::service_name,
  $ensure       = $::serf::params::service_ensure,
  $enable       = $::serf::params::service_enable
) inherits serf::params
{
  service { 'serf':
    ensure     => $ensure,
    enable     => $enable
  }
}
