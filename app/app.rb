ENV['database'] ||= 'MakersBnB'
# require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space.rb'
require_relative './lib/user.rb'
require_relative './lib/booking.rb'
require_relative './lib/hashHandler.rb'
require_relative './lib/anonymousHandler.rb'
require_relative './lib/check_booking.rb'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override
  get '/' do
    @user = session['user']
    @spaces = Space.all
    erb :index
  end

  get '/my-spaces' do
    bootAnon
    @spaces = Space.where(owner_id: session['user'].id)
    erb :my_spaces
  end

  get '/space-creator' do
    bootAnon
    erb :space_creator
  end

  get '/space-editor' do
    bootAnon
  end

  post '/space-editor' do
    bootAnon
    @space = Space.find(params[:space_id])
    erb :space_editor
  end

  post '/space' do
    bootAnon
    Space.create(
      space_name: params[:spacename],
      description: params[:description],
      price: params[:price],
      owner_id: session['user'].id
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

  post '/session' do
    access = HashHandler.new.authenticate(
      "tractorTR10@kul"+params[:password],
       User.find_by(username: params[:username]).pass_hash)
    access ? session['user'] = User.find_by(username: params[:username]) : redirect('/')
    redirect('/')
    #add sinatra flash for wrong password
  end

  delete '/session' do
    session['user'] = nil
    redirect '/'
  end

  put '/space' do
    space = Space.find(params['space_id'])
    if space.owner_id == session['user'].id
      space.update(
        space_name: params[:spacename],
        description: params[:description],
        price: params[:price]
      )
    end
    redirect '/my-spaces'
  end

  delete '/space' do
    Space.find(params['space_id']).destroy
    redirect '/my-spaces'
  end

  post '/booking/:id' do
    @space_id = params[:id]
    booking_available?(@space_id, params[:booking_date])
    Booking.create(
      user_id: session['user'].id,
      space_id: @space_id,
      booking_date: params[:booking_date]
    )
    # Request.create()
    redirect('/my-bookings')
  end

  get '/my-bookings' do
    bootAnon
    @bookings = Booking.where(user_id: session['user'].id)
    # @booking_and_name = []
    # @bookings.each{|x|
    #   @booking_and_name << {booking: x, name: Space.find(x.sapce_id).space_name}
    # }
    erb :my_bookings
  end

  run! if app_file == $0
end
