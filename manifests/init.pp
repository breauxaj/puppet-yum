class yum (
  $ensure = 'latest',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'yum' ],
  }

  package { $required: ensure => $ensure }

}