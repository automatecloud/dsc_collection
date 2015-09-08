# service.pp
# example DSC configuration to manage Windows service

class dsc_collection::service (
  $servicname = 'Dnscache',
  $startuptype = 'Manual',
  $servicestate = 'Running',
  ){
    # Create example package file
    dsc_service { 'ServiceExample':
      dsc_name        => $servicname ,
      dsc_startuptype => $startuptype ,
      dsc_state       => $servicestate ,
    }
}
