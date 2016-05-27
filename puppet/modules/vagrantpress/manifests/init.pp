# == Class: vagrantpress
#
# Full description of class vagrantpress here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { vagrantpress:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#

class vagrantpress {
# Check to see what dependencies are specified in facts.
  case $::webserver {
    'apache': {
      include vagrantpress::web::vp-apache
    }

    'nginx': {
      notify{'Install NGINX - NOT COMPLETE': }
      include vagrantpress::web::vp-nginx
    }

    'default' : {
      # Specify default to be apache.
      notify{'Default Web Server Not Specified - Installing Apache / PHP Runtime': }
      include vagrantpress::web::vp-apache
    }
  }




 # class{"vagrantpress::prepare":   }->
 # class{"vagrantpress::vp-mysql":
 #   web_root => '/vagrant/html',
 #   mysql_pass => 'pass',
 # }->
 # class{"vagrantpress::vp-phpfpm": }->
 # class{"vagrantpress::vp-nginx":  }->
 # class{"vagrantpress::wordpress": }




}
