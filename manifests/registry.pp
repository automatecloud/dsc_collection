# registry.pp
# example DSC configuration

class dsc_collection::registry (
  $key = 'HKEY_LOCAL_MACHINE\SOFTWARE\MySpecialKey',
  $valuestringname = 'TestValue',
  $valuestringdata = 'TestData',
  $valuedwordname = 'TestDword',
  $valuedworddata = '100',
  $valuebinaryname = 'TestBinary',
  $valuebinarydata = '46000000080000000100000000000000000000000000000000000000',
  $force = true,
  ){
    # Create example registry key and value
    dsc_registry { 'RegistryStringExample':
      dsc_ensure    => 'present',
      dsc_key       => $key ,
      dsc_valuename => $valuestringname ,
      dsc_valuedata => $valuestringdata ,
      dsc_valuetype => 'String' ,
      dsc_force     => $force ,
    }

    # Create example DWord Registry key and value
    dsc_registry { 'RegistryDWordExample':
      dsc_ensure    => 'present',
      dsc_key       => $key ,
      dsc_valuename => $valuedwordname ,
      dsc_valuedata => $valuedworddata ,
      dsc_valuetype => 'Dword' ,
      dsc_force     => $force ,
    }

    # Create example Binary Registry key and value

    dsc_registry { 'RegistryBinaryExample':
      dsc_ensure    => 'present',
      dsc_key       => $key,
      dsc_valuename => $valuebinaryname,
      dsc_valuedata => $valuebinarydata,
      dsc_valuetype => 'Binary',
      dsc_force     => $force,
    }
}
