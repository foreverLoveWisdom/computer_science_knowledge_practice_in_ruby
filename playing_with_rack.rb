require 'rack'
require 'thin'

class HelloWorld
  def call(env)
    puts env
    puts env.class
    [200, {"Content-Type": "text/plain"}, env]
  end
end

Rack::Handler::Thin.run HelloWorld.new
