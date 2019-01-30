require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

get "/" do
  @articles = DB
  @comments = COMMENTS
  erb :home
end
