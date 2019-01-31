require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

def store_usersNames(filename, usersName)
  File.open(filename, "a+") do |file|
    file.puts(usersName)
  end
end

def read_usersNames(filename)
  return File.read(filename).split("\n")
end

get "/" do
  erb :login
end

post "/" do
  @usersName = params["usersName"]
  store_usersNames("users.txt", @usersName)
  redirect "/home"
end

get "/home" do
  @usersNames = read_usersNames("users.txt")
  @articles = DB
  @comments = COMMENTS
  erb :home
end
