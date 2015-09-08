# environment.pp
# example DSC configuration to manage system environment variables

class dsc_collection::environment (
  $envvariablename = 'TestEnvironmentVariable',
  $envvariablevalue = 'TestValue',
  ){
    # Create example environment
    dsc_environment { 'EnvironmentExample':
      dsc_ensure => 'present',
      dsc_name   => $envvariablename ,
      dsc_value  => $envvariablevalue ,
    }
}
