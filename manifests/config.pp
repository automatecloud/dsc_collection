# === Authors
#
# Andreas Wilke <andreas@puppetlabs.com>
#
class dsc_collection::config (
  # Refresh Mode = Disabled, Pull or Push
  $refresh_mode = 'Disabled'
  ) {
    service {'wuauserv':
      ensure => 'running',
      enable => true,
    } ->
    # Install package powershell with chocolatey
    package { 'powershell':
    ensure          => installed,
    provider        => 'chocolatey',
    install_options => ['-pre','-y'],
  } ->
  # Disable local refresh mode
  dsc::lcm_config { 'disable lcm':
    refresh_mode => $refresh_mode,
  }
  reboot { 'after':
    subscribe => Package['powershell'],
  }
}
