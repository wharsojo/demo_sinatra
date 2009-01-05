require 'rubygems'
require 'sinatra'
require 'sequel'

DB = Sequel.sqlite('blog.db')
class Entry < Sequel::Model
end

get '/' do 
          @recs = Entry.all
          erb :index
        end
