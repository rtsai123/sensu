name 'sensu'
maintainer 'Robert Tsai'
maintainer_email 'rtsai'
license 'Private'
description 'Installs Sensu Core and configures either client or server or both'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

begin
  version IO.read(File.join(File.dirname(__FILE__), 'VERSION')).chomp
rescue
  version '0.1.0'
end


depends 'yum'
depends 'yum-epel'
