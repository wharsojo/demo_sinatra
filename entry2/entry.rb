require 'rubygems'
require 'sinatra'
require 'sequel'
require 'w2tags'
require 'w2tags/sinatra_hook' 
require 'sinatra_crud'

if !Object.constants.include? 'DB'
  DB = Sequel.sqlite('blog.db') 
end

sinatra_crud 'entry'

get '/info' do
  out = Sinatra::VERSION > '0.9' ? :"index.0.9.x" : :"index.0.3.x"
  erb out,:layout => :"layout_info"
end

get '/' do
  erb :home
end

