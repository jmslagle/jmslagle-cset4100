class cset4100::lab3 {
  include cset4100::base

  package { 'tomcat7':
    ensure => 'present',
  }

  package { 'mysql-server':
    ensure => 'present',
  }

  file { '/usr/share/tomcat7/conf/server.xml':
    ensure   => 'file',
    source   => 'pupet:///modules/cset4100/lab3/server.xml',
    owner    => 'tomcat',
    require  => Package['tomcat7'],
  }

  service { 'tomcat7':
    ensure    => 'running',
    enable    => 'true',
    subscribe => File['/usr/share/tomcat7/conf/server.xml'],
  }

  file { '/tmp/cset4100lab3.sh':
    ensure => 'file',
    source => 'puppet:///modules/cset4100/lab3/cset4100lab3.sh',
  }

  exec { 'prepare-lab':
    command => '/tmp/cset4100lab3.sh',
    creates => '/tmp/lab3prepped',
    user    => 'root',
  }
}

