require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AvengersApp
  class Application < Rails::Application
   
    config.load_defaults 5.2

    config.generators do |g|
      g.template_engine false
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework :rspec
      g.test_framework :rspec,
        fixtures: true,
        fixture_replacement: :factory_bot,
        view_specs: false,
        routing_specs: false,
        helper_specs: false,
        controller_specs: false,
        request_specs: true
    end

    config.api_only = true
    config.middleware.use ActionDispatch::Flash
  end
end
