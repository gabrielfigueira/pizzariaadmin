require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pizzariadmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :'pt-BR'
    config.generators do |g|
      g.stylesheets false
      g.test_framework  :test_unit, fixture: true
      g.javascripts     false
    end
    config.active_record.time_zone_aware_types = [:datetime, :time]
    Rails.application.config.active_record.belongs_to_required_by_default = false
  end
end
