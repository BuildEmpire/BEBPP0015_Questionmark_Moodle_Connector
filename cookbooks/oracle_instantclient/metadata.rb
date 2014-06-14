maintainer       'Fred Thompson'
maintainer_email 'fred.thompson@buildempire.co.uk'
license          'Apache 2.0'
description      'Oracle Instantclient'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'oracle_instantclient', 'Oracle Instantclient.'

%w{ ubuntu }.each do |os|
  supports os
end