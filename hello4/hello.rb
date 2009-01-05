require 'rubygems'
require 'sinatra'
require 'sequel'
require 'w2tags'
require 'w2tags/sinatra_hook' 

DB = Sequel.sqlite('blog.db')
class Entry < Sequel::Model
end

get '/' do 
          @recs = Entry.all
          erb :index
        end
