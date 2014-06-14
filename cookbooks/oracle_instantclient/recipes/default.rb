rpm_package "oracle-instantclient12.1-basic" do
  source File.join(Chef::Config[:file_cache_path], node['oracle_instantclient']['basic-rpm'])
  action :install
end