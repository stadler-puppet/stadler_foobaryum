class stadler_foobaryum {

  # notify {"this is class foobaryum":}
  
  user { 'foobar':
    ensure   => 'present',
    home     => '/home/foobar',
    password => '$6$hNzy4KXd$CduAS6283LZCCQ0azflcEaqX9/mEq2bjtg6Rt0rsKZevkxIwE93JG7CeNG1hImXpSFtZJV9GeJ4GKETESLQXB.',
    shell    => '/bin/sh',
  }
  
  case $::osfamily {
    'Debian': {
      notify {"foobar user will not be given sudo rights for yum on {$::osfamily} systems":}
    }
    'RedHat': {
      file_line { 'sudo_rule_foobar':
        path  => '/etc/sudoers',
        line  => 'foobar  ALL=NOPASSWD : /usr/bin/yum',
        require => User ['foobar'],
      }
    }
  }

}
