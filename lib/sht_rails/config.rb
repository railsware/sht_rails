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
    attr_accessor :template_base_path, :template_extension, :action_view_key, :template_namespace, :helper_path, :ruby_helpers

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
    
    def ruby_helpers
      @ruby_helpers ||= {}
    end
  end
end
