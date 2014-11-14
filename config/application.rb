# We will simply use rubygems to set our load paths
require "rubygems"
require File.expand_path('../boot', __FILE__)

# Require our dependencies
require "rails"
require "active_support/railtie"
require "action_controller/railtie"
class SingleFile < Rails::Application
  # Set up production configuration
  config.eager_load = true
  config.cache_classes = true

  config.root = File.expand_path('../..', __FILE__)
  require config.root.join('app/middlewares/logger')
  config.middleware.use LoggerMiddleware, "2 - rails app"

  # A key base is required for our app to boot
  config.secret_key_base = "pa34u13hsleuowi1aisejkez12u39201pluaep2ejlkwhkj"

  # Define a basic route
  require config.root.join('app/middlewares/endpoint')
  routes.append do
    mount Endpoint, at: "/hello"
  end
end
