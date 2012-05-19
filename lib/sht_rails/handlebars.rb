require "handlebars"
require "active_support"

module ShtRails

  module Handlebars
    def self.call(template)
      if template.locals.include?(ShtRails.action_view_key.to_s) || template.locals.include?(ShtRails.action_view_key.to_sym)
        #"Mustache.render(#{template.source.inspect}, #{SmtRails.action_view_key.to_s}).html_safe"
      else
        "#{template.source.inspect}.html_safe"
      end
    end
  end
end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler(::ShtRails.template_extension.to_sym, ::ShtRails::Handlebars)
end