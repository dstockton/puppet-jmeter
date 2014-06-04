# == Class: jmeter::server
#
# This class configures the server component of JMeter.
#
# === Examples
#
#   class { 'jmeter::server': }
#
class jmeter::server($server_ip = '0.0.0.0') {
  include jmeter

  $init_template = $osfamily ? {
    debian => 'jmeter/jmeter-init.erb',
    redhat => 'jmeter/jmeter-init.redhat.erb'
  }

  file { '/etc/init.d/jmeter':
    content => template($init_template),
    owner   => root,
    group   => root,
    mode    => 0755,
    notify  => Service['jmeter'],
  }

  if $osfamily == 'debian' {
    exec { 'jmeter-update-rc':
      command     => '/usr/sbin/update-rc.d jmeter defaults',
      subscribe   => File['/etc/init.d/jmeter'],
      refreshonly => true,
    }
  }

  service { 'jmeter':
    ensure    => running,
    enable    => true,
    require   => File['/etc/init.d/jmeter'],
  }
}
