require 'rubygems'
require 'sinatra'

get '/' do 
  @data = 'Hello World' 
  erb :index
end
