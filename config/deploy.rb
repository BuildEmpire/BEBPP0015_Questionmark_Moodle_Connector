# Set the application name
set :application, 'qm_buildempire_co_uk'

# Set the repository url
set :repo_url,  'git@github.com:BuildEmpire/BEBPP0015_Questionmark_Moodle_Connector.git'



# Use git at the version control
set :scm, :git

# Set the deployment location on the server
set :deploy_to, "/home/apps/#{fetch(:application)}"

# Set the log level for information
#set :log_level, :info

# Set the common linked files and directories
#set :linked_files, %w{public/client/config.inc.php public/server/config.inc.php}
set :linked_dirs, %w{private/backup public/data}

# Keep the number of releases defined here
set :keep_releases, 5

# Set the ssh to forward the agent
set :ssh_options, {
  forward_agent: true
}

task :check_for_ssh_agent do

  pid = ENV["SSH_AGENT_PID"]
  if pid.nil? or pid == "" or pid.to_i == 0
    result = `ssh-agent -t 600`
    # Extract env variables
    %w(SSH_AUTH_SOCK SSH_AGENT_PID).each do |key|
      if result =~ /#{key}=(.*?);/
        ENV[key] = $1
      end
    end
    cmd = "ssh-add #{File.join(ENV["HOME"], ".ssh", "id_rsa")}"
    result = `#{cmd}`
  end

  begin
    Process.getpgid(pid.to_i)
  rescue Errno::ESRCH
    raise %|The ssh-agent at pid #{pid} has died (cannot authenticate to github without it.) Try running "eval `ssh-agent`; ssh-add".|
  end

  if `ssh-add -L` =~ /no identities/
    raise %|The ssh-agent at pid #{pid} has no keys. Have you run "ssh-add"?|
  end
end
before 'deploy:starting', :check_for_ssh_agent

set :pty, true

namespace :deploy do

  desc 'Restart application'
  task :restart do
  end

  after :publishing, :clear_cache do
    on roles(:app), :in => :sequence, :wait => 5 do
    end
  end

end





