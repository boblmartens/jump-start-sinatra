require 'sinatra'
require 'slim'

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