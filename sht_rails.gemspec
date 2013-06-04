# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sht_rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexey Vasiliev"]
  gem.email         = ["leopard.not.a@gmail.com"]
  gem.description   = %q{Shared handlebars templates for rails 3}
  gem.summary       = %q{Shared handlebars templates for rails 3}
  gem.homepage      = "https://github.com/railsware/sht_rails"
  
  gem.extra_rdoc_files  = [ "LICENSE", "README.md" ]
  gem.rdoc_options      = ["--charset=UTF-8"]

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sht_rails"
  gem.require_paths = ["lib"]
  gem.version       = ShtRails::VERSION
  
  gem.add_runtime_dependency "rails",           ">= 3.1.0"
  gem.add_runtime_dependency "tilt",            ">= 1.3.3"
  gem.add_runtime_dependency "sprockets",       ">= 2.0.3"
  gem.add_runtime_dependency "handlebars",      ">= 0.4.0"
  gem.add_runtime_dependency "execjs",          ">= 0.3.0"

  gem.add_development_dependency "rake"
end
