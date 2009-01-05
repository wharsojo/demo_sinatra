require 'rubygems'
require 'sinatra'
require 'sequel'
require 'w2tags'
require 'w2tags/sinatra_hook' 

if !Object.constants.include? 'DB'
  DB = Sequel.sqlite('blog.db') 
  class Entry < Sequel::Model
  end
end

get '/' do
  erb :home
end






get '/entries' do
  @entries = Entry.all
  erb :entries_index
end

get '/entries/new' do
  @entry = Entry.new
  erb :entries_new
end

get '/entries/:id' do
  id = params[:id]
  @entry = Entry[id]
  erb :entries_edit
end


post '/entries/new' do
  Entry << params
  redirect '/entries'
end

put '/entries/:id' do
  id = params[:id]
  params.delete("_method")
  Entry.filter(:id=>id).update(params)
  redirect '/entries'
end

delete '/entries/:id' do
  id = params[:id]
  Entry.filter(:id=>id).delete
  redirect '/entries'
end


