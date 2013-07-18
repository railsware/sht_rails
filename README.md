# ShtRails

Shared handlebars templates for rails 3.

## Installation

Add this line to your application's Gemfile:

    gem 'sht_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sht_rails

## Usage

    $ rails g sht_rails:install

Generator add into "application.js" requirements for mustache and "templates" folder in "app". Next you can create handlebars templates in this folder or subfolders.

For example:

File: "app/templates/tests/_test.handlebars"

    Hello {{msg}}!!!

In view you can render this template by this way:

    <%= render "tests/test", :handlebars => {msg: "Test"} %> 

The same template you can render in JavaScript:

    var content = SHT['tests/test']({msg: "Test"});

## Configuration

    ShtRails.configure do |config|
      config.template_extension = 'handlebars' # change extension of mustache templates
      config.action_view_key    = 'handlebars' # change name of key for rendering in ActionView mustache template
      config.template_namespace = 'SHT'      # change templates namespace in javascript
      config.template_base_path = Rails.root.join("app", "templates") # templates dir
    end

### Note on precompiling assets and custom configs

In Rails, if you have config.assets.initialize\_on\_precompile set to false, but have placed the above config in an initializer, it will not run. To get around this, you can do the following in application.rb:

    if "assets" == ENV["RAILS_GROUPS"] || ["development", "test"].include?(ENV["RAILS_ENV"])
      ShtRails.template_namespace = 'JST'
    end


## Demo

Site: [http://st-rails-example.herokuapp.com](http://st-rails-example.herokuapp.com)

Source code: [https://github.com/le0pard/st_rails_example](https://github.com/le0pard/st_rails_example)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
