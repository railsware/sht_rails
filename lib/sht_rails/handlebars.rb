require "handlebars"
require "active_support"

module ShtRails

  module Handlebars
    def self.context(partials = nil)
      @context = begin
        context = ::Handlebars::Context.new
        runtime = context.instance_variable_get(:@js)

        ShtRails.dependencies.each { |dependency| runtime.eval dependency.source }

        if helpers = Rails.application.assets.find_asset(ShtRails.helper_path)
          runtime.eval helpers.source
        end
        partials.each { |key, value| context.register_partial(key, value) } if partials
        context
      end
    end

    def self.call(template)
      if template.locals.include?(ShtRails.action_view_key.to_s) || template.locals.include?(ShtRails.action_view_key.to_sym)
<<-SHT
  hbs_context_for_sht = if defined?(partials) && partials.is_a?(Hash)
    ShtRails::Handlebars.context(partials)
  else
    ShtRails::Handlebars.context
  end
  hbs_context_for_sht.compile(#{template.source.inspect}).call(#{ShtRails.action_view_key.to_s} || {}).html_safe
SHT
      else
        "#{template.source.inspect}.html_safe"
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler(::ShtRails.template_extension.to_sym, ::ShtRails::Handlebars)
end