# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require "capistrano/rbenv"
# require "capistrano/chruby"
require 'capistrano/rvm'
require "capistrano/bundler"
# require "capistrano/rails/assets"
# require "capistrano/rails/migrations"
require "capistrano/rails"
require "capistrano/passenger"



# https://www.digitalocean.com/community/tutorials/how-to-install-rails-and-nginx-with-passenger-on-ubuntu

#----------------- Post-install message from capistrano-passenger:---------------
# ==== Release notes for capistrano-passenger ====
# passenger once had only one way to restart: `touch tmp/restart.txt`
# Beginning with passenger v4.0.33, a new way was introduced: `passenger-config restart-app`

# The new way to restart was not initially practical for everyone,
# since for versions of passenger prior to v5.0.10,
# it required your deployment user to have sudo access for some server configurations.

# capistrano-passenger gives you the flexibility to choose your restart approach, or to rely on reasonable defaults.

# If you want to restart using `touch tmp/restart.txt`, add this to your config/deploy.rb:

#     set :passenger_restart_with_touch, true

# If you want to restart using `passenger-config restart-app`, add this to your config/deploy.rb:

#     set :passenger_restart_with_touch, false # Note that `nil` is NOT the same as `false` here

# If you don't set `:passenger_restart_with_touch`, capistrano-passenger will check what version of passenger you are running
# and use `passenger-config restart-app` if it is available in that version.

# If you are running passenger in standalone mode, it is possible for you to put passenger in your
# Gemfile and rely on capistrano-bundler to install it with the rest of your bundle.
# If you are installing passenger during your deployment AND you want to restart using `passenger-config restart-app`,
# you need to set `:passenger_in_gemfile` to `true` in your `config/deploy.rb`.
# ======================================================================================================



# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
