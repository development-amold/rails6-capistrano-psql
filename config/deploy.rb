# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"
# lock "~> 3.11.2"

set :application, "rails6-capistrano-psqlapp"
set :repo_url, "git@github.com:development-amold/rails6-capistrano-psql.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/html/#{fetch :application}"
set :use_sudo, true

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
namespace :deploy do
  namespace :check do
    before :linked_files, :set_master_key do
      on roles(:app), in: :sequence, wait: 10 do
        unless test("[ -f #{shared_path}/config/master.key ]")
          upload! 'config/master.key', "#{shared_path}/config/master.key"
        end
      end
    end
  end
end

# after 'deploy:updated', 'deploy:assets:precompile_locally_copy'


# after "deploy:setup", "deploy:create_release_dir"
# namespace :deploy do
# end

# namespace :deploy do
#   desc 'Run bin webpack'
#   task :bin_webpack do
#     on roles(:web) do
#       within release_path do
#         with rails_env: fetch(:rails_env) do
#           execute :bundle, 'exec rails assets:precompile'
#         end  
#       end
#     end
#   end
# end


  # task :example do
  #   on roles(:app) do
  #     execute "mkdir -p #{fetch :releases_path}"
  #   end
  # end
  

# namespace :deploy do
#   namespace :assets do
#     task :precompile, :roles => :web, :except => { :no_release => true } do
#       # run "mkdir -p #{fetch :releases_path}"
#       puts "------Started====="
#       begin
#         from = source.next_revision(current_revision) # <-- Fail here at first-time deploy because of current/REVISION absence
#       rescue
#         err_no = true
#       end
#       if err_no || capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0     
#         run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
#       else
#         logger.info "Skipping asset pre-compilation because there were no asset changes"
#       end
#    end
#   end
# end



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

# # clear the previous precompile task
# Rake::Task["deploy:assets:precompile"].clear_actions
# class PrecompileRequired < StandardError; end

# namespace :deploy do
#   namespace :assets do
#     desc "Precompile assets"
#     task :precompile do
#       on roles(fetch(:assets_roles)) do
#         within release_path do
#           with rails_env: fetch(:rails_env) do
#             begin
#               # find the most recent release
#               latest_release = capture(:ls, '-xr', releases_path).split[1]

#               # precompile if this is the first deploy
#               raise PrecompileRequired unless latest_release

#               latest_release_path = releases_path.join(latest_release)

#               # precompile if the previous deploy failed to finish precompiling
#               # execute(:ls, latest_release_path.join('assets_manifest_backup')) rescue raise(PrecompileRequired)

#               fetch(:assets_dependencies).each do |dep|
#                 # execute raises if there is a diff
#                 execute(:diff, '-Naur', release_path.join(dep), latest_release_path.join(dep)) rescue raise(PrecompileRequired)
#               end

#               info("Skipping asset precompile, no asset diff found")

#               # copy over all of the assets from the last release
#               execute(:cp, '-r', latest_release_path.join('public', fetch(:assets_prefix)), release_path.join('public', fetch(:assets_prefix)))
#             rescue PrecompileRequired
#               execute(:rake, "assets:precompile") 
#             end
#           end
#         end
#       end
#     end
#   end
# end

