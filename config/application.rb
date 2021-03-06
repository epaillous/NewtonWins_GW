require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NewtonWinsGw
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :fr
    ActiveModelSerializers.config.adapter = :json
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'https://newton-wins.herokuapp.com', 'https://www.saucepestorosso.com'
        resource '*',
         headers: :any, :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
         methods: [:get, :post, :options, :put, :delete]
      end
    end
  end
end
