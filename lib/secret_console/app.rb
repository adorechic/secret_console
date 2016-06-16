require "sinatra"
require "rcredstash"

module SecretConsole
  class App < Sinatra::Base
    DELIMITER = '.'

    set :views, File.expand_path('../views', __FILE__)
    enable :method_override

    Record = Struct.new(:path, :value)

    get '/*' do
      path = params['splat'].first.gsub("/", DELIMITER)

      keys = CredStash.list.map { |k, v| k }

      if keys.include?(path)
        return erb :show, locals: { value: CredStash.get(path), path: request.path_info }
      end

      unless path == ""
        keys = keys.grep(/\A#{path}#{DELIMITER}*/)
      end

      if keys.size == 0
        return erb :new, locals: { path: request.path_info }
      end

      values = {}
      links = {}

      keys.each do |key|
        child_path = key.gsub(path, '')
        child_path = child_path[1..-1] if child_path.start_with?(DELIMITER)
        childs = child_path.split(DELIMITER)

        if childs.size == 1
          link = (request.path_info.split('/') + [childs.first]).join('/')
          values[childs.first] = Record.new(link, CredStash.get(key))
        else
          link = (request.path_info.split('/') + [childs.first]).join('/')
          links[childs.first] = link
        end
      end

      erb :index, locals: { values: values, links: links }
    end

    post '/*' do
      path = params['splat'].first.gsub("/", DELIMITER)
      value = params['value']


      CredStash.put(path, value)

      # TODO Set flash message
      redirect to(request.path_info)
    end

    delete '/*' do
      path = params['splat'].first.gsub("/", DELIMITER)

      CredStash.delete(path)

      redirect to(request.path_info.split("/")[0..-2].join("/"))
    end
  end
end
