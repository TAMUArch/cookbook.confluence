name             'confluence'
maintainer       'Texas A&M'
maintainer_email 'jarosser06@tamu.edu'
license          'MIT'
description      'Installs/Configures confluence'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.2'
supports         'ubuntu', '>= 12.04'
supports         'centos', '>= 6.3'

%w(nginx ark postgresql database).each do |dep|
  depends dep
end
