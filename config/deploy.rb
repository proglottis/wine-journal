require "bundler/capistrano"

set :application, "wine-journal"
set :repository,  "git@github.com:proglottis/wine-journal.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"

set :deploy_to, "/srv/wine-journal"

server "redwine.nothing.co.nz", :app, :web, :db, :primary => true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

before "deploy:symlink", "assets:precompile"

namespace :assets do
  desc "Compile assets"
  task :precompile, :roles => :app do
    run "cd #{release_path} && rake RAILS_ENV=#{rails_env} assets:precompile"
  end
end
