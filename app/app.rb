ENV['database'] ||= 'MakersBnB'
# require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space'


class MakersBnB < Sinatra::Base
  get '/' do
    @spaces = Space.all
    erb :index
  end

  run! if app_file == $0
end
