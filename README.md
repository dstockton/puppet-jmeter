Puppet JMeter
=============

This class installs the latest stable version of JMeter (currently v2.11) from apache.org. If you use the `::server` class, an init-file will be added to `/etc/init.d` and JMeter will be started in server mode listening on the default port.

Both the `jmeter` and `jmeter::server` can optionally install the `jmeter-plugins` package which adds a lot of useful listeners, thread groups, etc.

The init script is based on the one available at https://gist.github.com/2830209.


Basic usage
-----------

Install JMeter:

    class { 'jmeter': }

Install JMeter v2.11 and JMeterPlugins v1.1.3

    class { 'jmeter':
      jmeter_version            => '2.11',
      jmeter_plugins_install    => True,
      jmeter_plugins_version    => '1.1.3',
    }

Install JMeter server using the default host-only IP address 0.0.0.0:

    class { 'jmeter::server': }

Install JMeter server using a custom host-only IP address:

    class { 'jmeter::server':
      server_ip => '33.33.33.42',
    }


Authors
-------

Morten Wulff  
<wulff@ratatosk.net>

Dario Duvnjak   
[@darioduvnjak](https://twitter.com/darioduvnjak)   
[![r8networks logo](http://i.imgur.com/15kgvi0.png)](http://beta.r8network.com/)

David Stockton