require 'tilt'

module ShtRails
  class Tilt < Tilt::Template
    def self.default_mime_type
      'application/javascript'
    end

    def prepare
      @namespace = "this.#{ShtRails.template_namespace}"
    end

    attr_reader :namespace

    def evaluate(scope, locals, &block)
      template_key = path_to_key scope
      <<-HandlebarsTemplate
  (function() { 
  #{namespace} || (#{namespace} = {});
  #{namespace}[#{template_key.inspect}] = function(object) {
    var template = Handlebars.compile(#{data.inspect});
    if (object == null){
      return template;
    } else {
      return template(object);
    }
  };
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