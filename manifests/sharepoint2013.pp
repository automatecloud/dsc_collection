# sharepoint.pp
# example Microsoft Sharepoint 2013 installation

class dsc_collection::sharepoint2013 (
  $spinstallerpath = 'c:\dsc\software\sharepoint',
  $spprereqinstallerpath = 'c:\dsc\software\prereqs',
  $spproductkey = 'XXX-XXX-XXX-XXX-XXX',
  )
{

    if $::kernelmajversion == '6.1' {

      $windowsfeaturearray = ['Web-Server','Web-WebServer','Web-Common-Http','Web-Static-Content','Web-Default-Doc','Web-Dir-Browsing','Web-Http-Errors','Web-App-Dev','Web-Asp-Net','Web-Net-Ext','Web-ISAPI-Ext','Web-ISAPI-Filter','Web-Health','Web-Http-Logging','Web-Log-Libraries','Web-Request-Monitor','Web-Http-Tracing','Web-Security','Web-Basic-Auth','Web-Windows-Auth','Web-Filtering','Web-Digest-Auth','Web-Performance','Web-Stat-Compression','Web-Dyn-Compression','Web-Mgmt-Tools','Web-Mgmt-Console','Web-Mgmt-Compat','Web-Metabase','Application-Server','AS-Web-Support','AS-TCP-Port-Sharing','AS-WAS-Support','AS-HTTP-Activation','AS-TCP-Activation','AS-Named-Pipes','AS-Net-Framework','WAS','WAS-Process-Model','WAS-NET-Environment','WAS-Config-APIs','Web-Lgcy-Scripting','Xps-Viewer']
      $windowsfeaturearray.each |String $winfeature| {
        dsc_windowsfeature { $winfeature:
          dsc_ensure => 'present',
          dsc_name   =>  $winfeature,
        }
      }
    #Install Prerequisites
    dsc_xspinstallprereqs { 'InstallPrereqs':
    dsc_ensure            => 'present',
    dsc_installerpath     => "${spinstallerpath}\Prerequisiteinstaller.exe",
    dsc_sqlncli           => "${spprereqinstallerpath}\sqlncli.msi",
    dsc_powershell        => "${spprereqinstallerpath}\Windows6.1-KB2506143-x64.msu",
    dsc_netfx             => "${spprereqinstallerpath}\dotNetFx45_Full_setup.exe",
    dsc_idfx              => "${spprereqinstallerpath}\Windows6.1-KB974405-x64.msu",
    dsc_sync              => "${spprereqinstallerpath}\Synchronization.msi",
    dsc_appfabric         => "${spprereqinstallerpath}\WindowsServerAppFabricSetup_x64.exe",
    dsc_idfx11            => "${spprereqinstallerpath}\MicrosoftIdentityExtensions-64.msi",
    dsc_msipcclient       => "${spprereqinstallerpath}\setup_msipc_x64.msi",
    dsc_wcfdataservices   => "${spprereqinstallerpath}\WcfDataServices.exe",
    dsc_wcfdataservices56 => "${spprereqinstallerpath}\WcfDataServices56.exe",
    dsc_kb2671763         => "${spprereqinstallerpath}\AppFabric1.1-RTM-KB2671763-x64-ENU.exe",
    dsc_onlinemode        => true,
  }
    # a Reboot is necessary after installing the prerequisites
    reboot { 'beforeInstallSharepoint':
        when  => pending,
    }
    #Install Sharepoint
    dsc_xspinstall { 'InstallSharepoint':
      dsc_ensure     => 'present',
      dsc_binarydir  => $spinstallerpath,
      dsc_productkey => $spproductkey,
      require        => Reboot['beforeInstallSharepoint'],
    }
  }
  else
  {
    warning ('This module is only supported with Server2008R2 and Service Pack 1.')
  }
}
