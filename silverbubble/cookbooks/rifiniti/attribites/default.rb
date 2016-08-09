# set up some java attributes
# default['java']['jdk_version'] = '7' # there is no openjdk 8 support and we don't like oracle
# default['java']['accept_license_agreement'] = true
# default['java']['set_etc_environment'] = true

# set up some apache spark attributes
default['apache_spark']['download_url'] =
  'http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz'
# The SHA256 checksum of the downloaded tarball.
default['apache_spark']['checksum'] =
  '3d46e990c06a362efc23683cf0ec15e1943c28e023e5b5d4e867c78591c937ad'
default['apache_spark']['pkg_version'] = '2.0.0'
