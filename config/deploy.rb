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

before 'deploy:create_symlink', 'deploy:ckeditor:symlink'

namespace :deploy do
  namespace :assets do
      task :precompile, :roles => :web, :except => { :no_release => true } do
        from = source.next_revision(current_revision)
        if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
          run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
        else
          logger.info "Skipping asset pre-compilation because there were no asset changes"
        end
    end
  end
  namespace :ckeditor do
    desc "Symlink ckeditor assets"
    task :symlink, :roles => :app do
      run "mkdir -p #{shared_path}/ckeditor_assets"
      run "ln -nfs #{shared_path}/ckeditor_assets #{release_path}/public/ckeditor_assets"
    end
  end
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

end
