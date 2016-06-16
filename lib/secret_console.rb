require "secret_console/version"
require "sinatra"

module SecretConsole
  class App < Sinatra::Base
    get '/' do
      'Hello'
    end
  end
end
