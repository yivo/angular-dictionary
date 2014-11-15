require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rademade
  class Application < Rails::Application

    config.assets.paths << "#{config.root}/vendor/assets/javascripts/bower_components"

    config.secret_key_base = 'ht3CnYYTcxCqfjcEQLBwDMmqvpvD3'

    config.time_zone = 'Kyiv'

    config.i18n.fallbacks = true
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ru]
    config.i18n.enforce_available_locales = false
    config.i18n.fallbacks = {:ru => :en}

    config.angular_templates.module_name    = 'templates'
    config.angular_templates.ignore_prefix  = %w(templates/)
    config.angular_templates.markups        = %w(erb slim)
    config.angular_templates.htmlcompressor = false

  end
end