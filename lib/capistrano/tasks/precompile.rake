namespace :deploy do
  namespace :assets do

    desc 'Precompile assets locally and upload to server'
    task :precompile_locally_copy do
      on roles(:app) do
        run_locally do
          with rails_env: fetch(:rails_env) do
            execute 'rake assets:precompile'
          end
        end

        execute "cd #{release_path} && mkdir public" rescue nil
        execute "cd #{release_path} && mkdir public/assets" rescue nil
        execute 'rm -rf public/assets/*'

        upload! 'public/assets', "#{release_path}/public", recursive: true

      end
    end
  end
end