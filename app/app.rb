ENV['database'] ||= 'MakersBnB'
# require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space.rb'
require_relative './lib/user.rb'
require_relative './lib/hashHandler.rb'


class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  get '/' do
    @user = session['user']
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
    session['user'] = User.create(
      username: params[:username],
      email: params[:email],
      pass_hash: HashHandler.new.to_hash("tractorTR10@kul"+params[:password])
    )
    redirect '/'
  end

  delete '/session' do
    session['user'] = nil
    redirect '/'
  end

  run! if app_file == $0
end
