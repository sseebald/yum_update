class yum_update {

  file {'/etc/puppetlabs/facter':
    ensure => directory,
  }

  file {'/etc/puppetlabs/facter/facts.d':
    ensure => directory,
  }

  file {'/etc/puppetlabs/facter/facts.d/yum_update.sh':
    ensure => file,
    mode   => 0755,
    source => "puppet:///modules/yum_update/yum_update.sh",
  }

  if $osfamily == 'RedHat' {
    runyer::posix_command {'yum_upgrade':
      command => 'yum upgrade -y',
    }
  }
  elsif $osfamily == 'Debian' {
    runyer::posix_command {'apt_upgrade':
      command => 'apt-get upgrade -y',
    }
  }
  else {
    notify {'Unsupported OS':}
  }
}
