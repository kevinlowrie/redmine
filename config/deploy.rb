set :application, "www.deployit4.me"
set :repository,  "."

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ns2.deployit4.me"    # Your HTTP server, Apache/etc
role :app, "ns2.deployit4.me"    # This may be the same as your `Web` server
role :db,  "ns2.deployit4.me", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here" # if needed


# these are the steps for sending it from here to the server
# use from the #{RAILS_ROOT}/ directory via the incantation -
#    `cap deploy:{start,stop,restart}
# this deployment configured by kevinlowrie@gmail.com 09/23/2011

namespace :deploy do
  task :start do ; 
    run "#{try_sudo} touch #{File.join(current_path,'tmp','art.txt')}"
  end

  task :stop do ; 
  end
 
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
