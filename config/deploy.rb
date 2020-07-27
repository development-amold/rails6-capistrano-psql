# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"
# lock "~> 3.11.2"

set :repo_url, "git@github.com:development-amold/rails6-capistrano-psql.git"

set :rvm_ruby_version, '2.7.1'

set :deploy_via, :remote_cache #---it clones first time only and onwards it just does the pull

set :copy_exclude, [ '.git' ]

set :keep_releases, 3  #---it will keep only last 3 release app_folder and older than that will be deleted

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :use_sudo, true
# set :passenger_restart_with_sudo, true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/master.key"
# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'node_modules', 'public/packs'

#---MASTER.KEY file from localhost to server and stored in shraed folder
# namespace :deploy do
#   namespace :check do
#     before :linked_files, :set_master_key do
#       on roles(:app), in: :sequence, wait: 10 do
#         [].each do |file|

#         end
#         unless test("[ -f #{shared_path}/config/master.key ]")
#           upload! 'config/master.key', "#{shared_path}/config/master.key"
#           upload! 'Passengerfile.json', "#{shared_path}/Passengerfile.json"
#         end
#       end
#     end
#   end
# end

namespace :deploy do
  namespace :check do
    before :linked_files, :upload_files do
      on roles(:app), in: :sequence, wait: 10 do
        ['config/master.key'].each do |file|
          unless test("[ -f #{shared_path}/#{file} ]")
            upload! file, "#{shared_path}/#{file}"
            # upload! 'Passengerfile.json', "#{shared_path}/Passengerfile.json"
          end
        end
      end
    end
  end
end

# before "deploy:rollback", "deploy:rollback_database"
# namespace :deploy do
#   desc "Rolls back database to migration level of the previously deployed release"
#   task :rollback_database, :roles => :db, :only => { :primary => true } do
#     if releases.length < 2
#       abort "could not rollback the code because there is no prior release"
#     else
#       rake = fetch(:rake, "rake")
#       rails_env = fetch(:rails_env)
#       migrate_env = fetch(:migrate_env, "")
#       migrate_target = fetch(:migrate_target, :latest)
#       run "cd #{current_path}; #{rake} RAILS_ENV=#{rails_env} #{migrate_env} db:migrate VERSION=`cd #{File.join(previous_release, 'db', 'migrate')} && ls -1 [0-9]*_*.rb | tail -1 | sed -e s/_.*$//`"
#     end
#   end
# end




# namespace :sidekiq do
#   task :restart do
#     on roles(:worker) do
#       execute :sudo, :systemctl, :restart, "fetch(:sidekiq_service_name)"
#     end
#   end  
# end
# after "deploy:published", "sidekiq:restart"


# set :assets_manifests, ['app/assets/config/manifest.js']


# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }


# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure



# # set the locations that we will look for changed assets to determine whether to precompile
# set :assets_dependencies, %w(app/assets lib/assets Gemfile.lock config/routes.rb app/assets/config/manifest.js)
