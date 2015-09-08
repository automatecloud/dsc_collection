# archive.pp
# example DSC configuration to manage archive zip file

class dsc_collection::archive (
  $path = 'C:\Users\Public\Documents\Test.zip',
  $destination = 'C:\Users\Public\Documents\ExtractionPath',
  ){
    # Create example archive extraction
    dsc_archive { 'ArchiveExample':
      dsc_ensure      => 'present',
      dsc_path        => $path ,
      dsc_destination => $destination ,
    }
}
