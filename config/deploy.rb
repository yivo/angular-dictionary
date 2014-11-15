lock '3.2.1'

set :application, 'Rademade'

set :deploy_to, '/var/www/rademade'

set :scm, :git
set :repo_url, 'git@github.com:Rademade/rademade_website.git'

# setup rvm.
set :rvm_type,          :system
set :rvm_ruby_version,  'ruby-2.1.1@rademade_website'

# how many old releases do we want to keep, not much
set :keep_releases, 5

# files we want symlinking to specific entries in shared
set :linked_files, %w{config/mongoid.yml}

# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/uploads}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(mongoid.yml))

# HipChat settings
#
set :hipchat_token,         ENV['HIPCHAT_AUTH_TOKEN']
set :hipchat_room_name,     '379396'
set :hipchat_announce,      false
set :hipchat_color,         'yellow'
set :hipchat_success_color, 'green'

# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

namespace :deploy do

  desc 'Download bower components for admin panel'
  task 'admin:bower:install' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'rademade_admin:bower:install'
        end
      end
    end
  end

  desc 'Download bower components for public part'
  task 'bower:install' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'bower:install'
        end
      end
    end
  end

  desc 'Restart application'
  after :restart, :restart_passenger do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

  namespace :assets do
    before :backup_manifest, 'deploy:assets:create_manifest_json'
    task :create_manifest_json do
      on roles :web do
        within release_path do
          execute :mkdir, release_path.join('assets_manifest_backup')
        end
      end
    end
  end

  before 'deploy:assets:precompile', 'deploy:admin:bower:install'
  before 'deploy:assets:precompile', 'deploy:bower:install'
  after :finishing, 'deploy:restart_passenger'
  after :finishing, 'deploy:cleanup'
end

namespace :orm do

  desc 'Fix localizations'
  task 'localization:fix' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'localization:fix'
        end
      end
    end
  end

  desc 'Fix bad visible status'
  task 'visible_status:fix' do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'localization:fix'
        end
      end
    end
  end

end