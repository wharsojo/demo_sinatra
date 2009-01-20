require 'rubygems'
require 'sinatra'
require '../sinatra.0.9.x'
require 'sequel'

DB = Sequel.sqlite('blog.db')
class Entry < Sequel::Model
end

get '/' do 
          @recs = Entry.all
          erb :index
        end
