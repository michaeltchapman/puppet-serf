class serf::install(
  $package_name = $::serf::params::package_name,
  $ensure       = $::serf::params::package_ensure,
) {
  package { 'serf':
    name   => $package_name,
    ensure => $package_ensure
  }
}
