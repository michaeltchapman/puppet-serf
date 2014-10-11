class serf::params{
  $version          = '0.6.3'

  $config_owner      = 'serf'
  $config_group      = 'serf'
  $config_dir        = '/etc/serf/conf.d'
  $config_file       = "${config_dir}/serf.json"
  $config_file_mode  = '0644'
  $config_dir_mode   = '0644'

  $node_name               = $::fqdn
  $tags                    = {}
  $bind                    = $::ipaddress
  $retry_join              = ['127.0.0.1']
  $replay_on_join          = false
  $snapshot_path           = '/etc/serf/'
  $enable_syslog           = true

  $package_name     = 'serf'
  $package_ensure   = 'installed'

  $service_name = 'serf'
  $service_ensure = true
  $service_hasrestart = true
  $service_hasstatus = true

}
