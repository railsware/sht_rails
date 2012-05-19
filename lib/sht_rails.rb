require "sht_rails/version"
require "sht_rails/config"

module ShtRails
  extend Config

  autoload(:Tilt, 'sht_rails/tilt')

  if defined?(Rails)
    require 'sht_rails/engine'
  else
    require 'sprockets'
    Sprockets.register_engine ".#{ShtRails.template_extension}", Tilt
  end
end

# init action view handler
require "sht_rails/handlebars"
