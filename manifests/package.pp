# package.pp
# example DSC configuration to manage package file

class dsc_collection::package (
  $path = 'C:\Users\Public\Documents\TestInstaller.msi',
  $packagename = 'MyTestPackage',
  $productid = '663A8209-89E0-4C48-898B-53D73CA2C14B',
  ){
    # Create example package file
    dsc_package { 'PackageExample':
      dsc_ensure    => 'present',
      dsc_path      => $path ,
      dsc_name      => $packagename ,
      dsc_productid => $productid ,
    }
}
