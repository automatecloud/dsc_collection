# === Authors
#
# Andreas Wilke <andreas@puppetlabs.com>
#
class dsc_collection::config {
  dsc::lcm_config { 'disable lcm':
    refresh_mode => 'Disabled',
  }
}
