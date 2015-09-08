# userandgroup.pp
# example DSC configuration to manage a user and a group

class dsc_collection::userandgroup (
  $groupname = 'MyTestGroup',
  $groupdescription = 'MyTestGroupDescription' ,
  $username = 'MyTestUser',
  $userfullname = 'My Super Test User',
  $userdescription = 'My Test User Description' ,
  $userdisabled = true ,
  $passwordneverexpires = true ,
  $passwordchangenotallowed = true ,
  $passwordchangerequired = false ,
  ){
    # Create example user
    dsc_user { 'MyTestUser':
      dsc_ensure                   => 'present',
      dsc_disabled                 => $userdisabled ,
      dsc_username                 => $username ,
      dsc_fullname                 => $userfullname ,
      dsc_passwordneverexpires     => $passwordneverexpires ,
      dsc_passwordchangenotallowed => $passwordchangenotallowed ,
      dsc_passwordchangerequired   => $passwordchangerequired ,
      dsc_description              => $userdescription ,
    } ->
    # Create example group
    dsc_group { 'MyTestGroup':
      dsc_ensure           => 'present',
      dsc_groupname        => $groupname ,
      dsc_description      => $groupdescription ,
      dsc_memberstoinclude => $username ,
    }
}
