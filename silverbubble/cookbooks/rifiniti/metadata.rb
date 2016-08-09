name 'rifiniti'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures rifiniti'
long_description 'Installs/Configures rifiniti'
version '0.1.1'

depends 'java', '~> 1.41.0'
depends 'maven', '~> 2.2.0'
depends 'apache_spark', '~> 1.2.12'

%w{ ubuntu macos }.each { |os| supports os }