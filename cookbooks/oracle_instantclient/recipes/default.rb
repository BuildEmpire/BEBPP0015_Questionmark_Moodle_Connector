cookbook_file node['oracle_instantclient']['basic_zip'] do
  path File.join(Chef::Config[:file_cache_path], node['oracle_instantclient']['basic_zip'])
  action :create_if_missing
end

cookbook_file node['oracle_instantclient']['sdk_zip'] do
  path File.join(Chef::Config[:file_cache_path], node['oracle_instantclient']['sdk_zip'])
  action :create_if_missing
end

directory "/usr/lib/oracle/#{node['oracle_instantclient']['version']}/client64" do
  action :create
  recursive true
end

execute "Unzip basic into directory" do
  command "unzip -o #{File.join(Chef::Config[:file_cache_path], node['oracle_instantclient']['basic_zip'])} -d /tmp"
end

execute "Unzip sdk into directory" do
  command "unzip -o #{File.join(Chef::Config[:file_cache_path], node['oracle_instantclient']['sdk_zip'])} -d /tmp"
end

execute "Move the files" do
  command "mv /tmp/#{node['oracle_instantclient']['folder_name']} /usr/lib/oracle/#{node['oracle_instantclient']['version']}/client64/lib"
end

link "/usr/lib/oracle/#{node['oracle_instantclient']['version']}/client64/lib/libclntsh.so" do
  to "/usr/lib/oracle/#{node['oracle_instantclient']['version']}/client64/lib/libclntsh.so.#{node['oracle_instantclient']['version']}"
end