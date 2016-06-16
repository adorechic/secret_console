require "sinatra"

module SecretConsole
  class App < Sinatra::Base

    set :views, File.expand_path('../views', __FILE__)

    get '/*' do
      erb :index
    end
  end
end
