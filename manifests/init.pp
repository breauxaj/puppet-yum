class yum (
  $ensure = 'latest',
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [
      'yum',
      'yum-plugin-fastestmirror'
    ],
  }

  package { $required: ensure => $ensure }

  file { '/etc/yum.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package[$required],
  }

  file { '/etc/yum.repos.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755'
    require => Package[$required],
  }

}