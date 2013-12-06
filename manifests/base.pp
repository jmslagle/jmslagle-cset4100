class cset4100::base {
  file { '/etc/motd':
    ensure => file,
    source => 'puppet:///modules/cset4100/etc/motd',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
 
