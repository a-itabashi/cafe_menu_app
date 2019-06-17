require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CafeMenuApp
  class Application < Rails::Application
   
    config.load_defaults 5.2

    config.api_only = true
    config.middleware.use ActionDispatch::Flash

    config.autoload_paths += %W(#{config.root}/app/services)

  end
end
