require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tutorial
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # ActiveJob queue adapter
    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.test_frameword :rspec,
        view_specs: false,
        helper_specs: false,
        controller_specs: true,
        routing_specs: false
    end
  end
end
