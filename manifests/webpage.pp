# webpage.pp
# example DSC webpage installation

class dsc_collection::webpage (
  $websitename = 'MyWebPage',
  $zipname = 'MyWebpageZipFile.zip',
  $zipfolder = 'c:\tmp',
  $destinationpath = 'C:\inetpub\MyWebPage',
  $defaultwebsitepath = 'C:\inetpub\wwwroot',
  ){
    
    $zipfile = "${zipfolder}\\${zipname}"

    # Install the IIS role
    dsc_windowsfeature { 'IIS':
      dsc_ensure => 'present',
      dsc_name   => 'Web-Server'
    } ->

    # Install the ASP .NET 4.5 role
    dsc_windowsfeature { 'AspNet45':
      dsc_ensure => 'present',
      dsc_name   => 'Web-Asp-Net45',
    } ->

    # Install IIS Web Management Console
    dsc_windowsfeature { 'IIS Management Console':
      dsc_ensure => 'present',
      dsc_name   => 'Web-Mgmt-Console',
    } ->

    # Stop an existing website (default)
    dsc_xwebsite { 'Stop DefaultSite':
        dsc_ensure       => 'present',
        dsc_name         => 'Default Web Site',
        dsc_state        => 'Stopped',
        dsc_physicalpath => $defaultwebsitepath,
    } ->

    # Extract the website content
    dsc_archive {'Unzip and Copy the WebContent':
      dsc_ensure      => 'present',
      dsc_path        => $zipfile,
      dsc_destination => $destinationpath,
    } ->

    # Create a new Website
    dsc_xwebsite { 'BackeryWebSite':
      dsc_ensure       => 'present',
      dsc_name         => $websitename,
      dsc_state        => 'Started',
      dsc_physicalpath => $destinationpath,
    }
  }
