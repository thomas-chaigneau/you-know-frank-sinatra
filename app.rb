require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

print DB
print '-------------------'
print COMMENTS

get "/" do
  @database = DB
  erb :home
end
