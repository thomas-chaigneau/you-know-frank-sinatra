require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

for n in DB
  puts n[:photo]
  puts !n[:photo].nil?
  puts '---------------------'
end

get "/" do
  @articles = DB
  @comments = COMMENTS
  erb :home
end
