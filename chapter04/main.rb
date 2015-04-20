require 'sinatra'
require 'slim'
require 'sass'

require './song'

configure do
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

get('/styles.css'){scss :styles}

get '/' do
  @title = "There's No Place Like Home"
  slim :home
end

get '/about' do
  @title = "All About This Website"
  slim :about
end

get '/contact' do 
  @title = "Smooth As Silk"
  slim :contact
end

not_found do
  slim :not_found
end

get '/songs' do
  @songs = Song.all
  slim :songs
end

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
  "Hello #{session[:name]}"
end

get '/login' do
  slim :login
end

post '/login' do
  if params[:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    redirect to('/songs')
  else
    slim :login
  end
end

get '/login' do
  session.clear
  redirect to('/login')
end