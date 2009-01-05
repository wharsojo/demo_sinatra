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
  erb :info,:layout => :layout_info
end

get '/' do
  erb :home
end

