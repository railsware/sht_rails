require 'sht_rails/asset_dependency'
require 'sht_rails/content_dependency'

module ShtRails
  # Change config options in an initializer:
  #
  # ShtRails.template_extension = 'handlebars'
  #
  # Or in a block:
  #
  # ShtRails.configure do |config|
  #   config.template_extension = 'handlebars'
  # end

  module Config
    extend self

    attr_writer :template_base_path, :template_extension, :action_view_key, :template_namespace, :helper_path, :dependencies

    def configure
      yield self
    end

    def template_base_path
      @template_base_path ||= Rails.root.join("app", "templates")
    end

    def template_extension
      @template_extension ||= 'handlebars'
    end

    def action_view_key
      @action_view_key ||= 'handlebars'
    end

    def template_namespace
      @template_namespace ||= 'SHT'
    end

    def helper_path
      @helper_path ||= 'templates/helpers.js'
    end

    def dependencies
      @dependencies ||= []
    end
  end
end
