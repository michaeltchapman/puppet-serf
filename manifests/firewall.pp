class serf::firewall(
  $source,
  $port = $::serf::params::port,
  $port_tcp_priority = '333',
  $port_udp_priority = '334'
) {
  firewall { "${port_tcp_priority} serf accept tcp":
    proto => 'tcp',
    port  => [$port],
    action => accept,
    source => $source
  }

  firewall { "${port_udp_priority} serf accept udp":
    proto => 'udp',
    port  => [$port],
    action => accept,
    source => $source
  }
}
