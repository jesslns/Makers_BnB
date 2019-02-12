ENV['database'] ||= 'MakersBnB'
# require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space'


class MakersBnB < Sinatra::Base
  enable :method_override
  get '/' do
    @spaces = Space.all
    erb :index
  end

  get '/my-spaces' do
    @spaces = Space.all
    erb :my_spaces
  end

  get '/space-creator' do
    erb :space_creator
  end

  post '/space-editor' do
    @space = Space.find(params[:space_id])
    erb :space_editor
  end

  post '/space' do
    Space.create(
      space_name: params[:spacename],
      description: params[:description],
      price: params[:price]
    )
    redirect '/'
  end

  put '/space' do
    Space.find(params['space_id']).update(
      space_name: params[:spacename],
      description: params[:description],
      price: params[:price]
    )
    redirect '/my-spaces'
  end

  run! if app_file == $0
end
