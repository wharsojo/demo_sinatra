require 'rubygems'
require 'sinatra'
require '../sinatra.0.9.x'

get '/' do 
  @data = 'Hello World' 
  erb :index
end
