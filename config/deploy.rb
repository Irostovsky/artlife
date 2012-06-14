require 'bundler/capistrano'
require "rvm/capistrano"
load 'deploy/assets'

set :rvm_ruby_string, '1.9.3@artlife'

set :application, :artlife

set :deploy_to, "/var/www/apps/artlife"

set :scm, :git

set :repository,  "git@github.com:Irostovsky/artlife.git"

set :deploy_via, :copy
set :copy_strategy, :export

set :user, 'ubuntu'

server '198.101.203.209', :app, :web, :db, :primary => true

set :use_sudo, false

namespace :deploy do

  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
