require 'tilt'
require 'execjs'

module ShtRails
  class Tilt < Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
      @namespace = "this.#{ShtRails.template_namespace}"
    end

    attr_reader :namespace

    def precompile(template)
      @context ||= begin
        handlebars_path = File.expand_path("../../../vendor/assets/javascripts/handlebars.js", __FILE__)
        ExecJS.compile File.read(handlebars_path)
      end
      @context.call("Handlebars.precompile", template)
    end

    def evaluate(scope, locals, &block)
      template_key = path_to_key scope
      <<-HandlebarsTemplate
  (function() {
  #{namespace} || (#{namespace} = {});
  #{namespace}[#{template_key.inspect}] = Handlebars.template(#{precompile(data)});
  }).call(this);
      HandlebarsTemplate
    end

    def path_to_key(scope)
      path = scope.logical_path.to_s.split('/')
      path.last.gsub!(/^_/, '')
      path.join('/')
    end
  end
end