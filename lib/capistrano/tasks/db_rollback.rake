namespace :deploy do
  namespace :database do
    task rollback: [:set_rails_env] do
      on release_roles([:db]) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, "db:rollback"
          end
        end
      end
    end
  end
end
