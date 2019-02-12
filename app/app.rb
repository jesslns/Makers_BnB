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

  get '/post-space' do
    erb :postspace
  end

  post '/post-space' do
    Space.create(
      space_name: params[:spacename],
      description: params[:description],
      price: params[:price]
    )
    redirect '/'
  end

  get '/users' do
    erb :users
  end

  post '/users' do
    
  end

  run! if app_file == $0
end
