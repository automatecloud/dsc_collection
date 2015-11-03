# === Authors
#
# Andreas Wilke <andreas@puppetlabs.com>
# It only works with Windows 2012R2. With Windows 2008R2 it throws an error.

class dsc_collection::config (
  # Refresh Mode = Disabled, Pull or Push
  $refresh_mode = 'Disabled'
  ) {
    if $::kernelmajversion == '6.3' {
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
  elsif $::kernelmajversion == '6.1' {
    warning( 'This module does not yet work on Windows Server 2008R2.')
    warning( 'Please download and install the necessary')
    warning( 'Windows Management Framework 5.0 for Windows 2008R2.' )
  }
  else {
    warning( 'Your operatingsystem is currently not supported with this module')
    warning( 'Please do not use the config manifest file')
  }
}
