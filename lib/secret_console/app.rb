require "sinatra"
require "rcredstash"

module SecretConsole
  class App < Sinatra::Base
    DELIMITER = '.'

    set :views, File.expand_path('../views', __FILE__)

    get '/*' do
      path = params['splat'].first.gsub("/", DELIMITER)

      keys = CredStash.list.map { |k, v| k }

      if keys.include?(path)
        return erb :show, locals: { value: CredStash.get(path) }
      end

      unless path == ""
        keys = keys.grep(/\A#{path}#{DELIMITER}*/)
      end

      values = {}
      links = {}

      keys.each do |key|
        child_path = key.gsub(path, '')
        child_path = child_path[1..-1] if child_path.start_with?(DELIMITER)
        childs = child_path.split(DELIMITER)

        case childs.size
        when 0
          # TODO
        when 1
          values[childs.first] = CredStash.get(key)
        else
          links[childs.first] = [path, '/', childs.first].join
        end
      end

      erb :index, locals: { values: values, links: links }
    end
  end
end
