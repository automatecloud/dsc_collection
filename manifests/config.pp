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
      if $::chocolatey_packages != undef
      {
        if $::chocolatey_packages =~ /PowerShell 5.0/ {
          #Powershell already installed.
          # Disable local refresh mode
          dsc::lcm_config { 'disable lcm':
            refresh_mode => $refresh_mode,
          }
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
    }
    else
    {
        warning ('Chocolatey is not installed so far.')
        warning ('Please make sure you installed Chocolatey')
    }
  }
  elsif $::kernelmajversion == '6.1' {
    warning( 'You are using this module with Windows Server 2008R2.')
    warning( 'Please make sure Service Pack 1 is installed!')
    # Install package powershell with chocolatey.
    # And workaround for chocolatey provider
    # as it will identify PowerShell as not installed.
    if $::chocolatey_packages != undef
    {
      if $::chocolatey_packages =~ /PowerShell 5.0.10514-ProductionPreview/ {
        #Powershell already installed.
        dsc::lcm_config { 'disable lcm':
          refresh_mode => $refresh_mode,
        }
      }
      else
      {
        #Not install will use package to install
        # Need to install .Net 4.5.1 first.
        package { 'dotnet4.5.1':
          ensure   => installed,
          provider => 'chocolatey',
        }

        package { 'powershell':
          ensure          => installed,
          provider        => 'chocolatey',
          require         => Package['dotnet4.5.1'],
          install_options => ['-pre','-y'],
        }
        reboot { 'after':
            subscribe       => Package['powershell'],
        }
      }
    }
    else
    {
      warning ('Chocolatey is not installed so far.')
      warning ('Please make sure you installed Chocolatey')
    }
  }
  else {
    warning( 'Your operatingsystem is currently not supported with this module')
    warning( 'Please do not use the config manifest file')
  }
}
