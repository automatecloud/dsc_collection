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
    }
    # Install package powershell with chocolatey.
    # And workaround for chocolatey provider
    # as it will identify PowerShell as not installed.
    if $::chocolatey_packages =~ /PowerShell 5.0.10514-ProductionPreview/ {
      #Powershell already installed.
      #notify { "Package is already installed":}
    }
    else
    {
      #Not install will use package to install
      package { 'powershell':
        ensure          => installed,
        provider        => 'chocolatey',
        install_options => ['-pre','-y'],
      }
      reboot { 'after':
          subscribe       => Package['powershell'],
      }
    }
  # Disable local refresh mode
  dsc::lcm_config { 'disable lcm':
    refresh_mode => $refresh_mode,
  }
}
