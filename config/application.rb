require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

config.react.jsx_transform_options = {
  harmony: true,
  strip_types: true, # for removing Flow type annotations
}

module ChatSpace
  class Application < Rails::Application
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
      config.i18n.default_locale = :ja
    end
  end
end
