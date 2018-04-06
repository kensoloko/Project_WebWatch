require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module WebWatch
  class Application < Rails::Application
    config.load_defaults 5.1
    config.genrerators do |g|
      g.test_framework false
      g.assets false
    end
  end
end
