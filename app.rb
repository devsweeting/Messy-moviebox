require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/movie")
require("./lib/patron")
require("pg")
require("pry")

DB = PG.connect({:dbname => "moviebox"})

enable :sessions

get ('/') do
  erb :index
end

# ADMIN PORTAL
get ('/admin') do
  @movies = Movie.all
  erb :admin
end

get ('/add_movie') do
  erb :add_movie
end

post ('/add_movie') do
  title = params.fetch("title")
  genre = params.fetch("genre")
  actors = params.fetch("actors")
  movie = Movie.new({:title => title, :actors => actors, :genre => genre, :checkedout => false, :id => nil})
  movie.save
  @title = movie.title
  @genre = movie.genre
  @actors = movie.actors
  @movies = Movie.all
  erb(:admin)
end

get ('/edit_movie/:id') do
  uid = params[:id].to_i
  @movie = Movie.find(uid)
  erb (:edit_movie)
end

patch ('/edit_movie/:id') do
  title = params.fetch("title")
  genre = params.fetch("genre")
  actors = params.fetch("actors")
  uid = params[:id].to_i
  @movies = Movie.find(uid)
  @movies.update({:title => title, :actors => actors, :genre => genre, :checkedout => false, :id => nil})
  @movies = Movie.all
  erb (:admin)
end

delete ("/edit_movie/:id") do
  @movie = Movie.find(params.fetch("id").to_i())
  @movie.delete()
  @movies = Movie.all()
  redirect "/admin"
end

# PATRON PORTAL

get ('/patron') do
  @movies = Movie.all
  erb :patron
end

get ('/create_profile') do
  erb :create_profile
end

post ('/create_profile') do
  name = params.fetch("name")
  patron = Patron.new({:name => name, :id => nil})
  patron.save
  @name = patron.name
  @patron = Patron.all
  erb :log_in
end

get ('/log_in') do
  @patron = Patron.all
  erb :log_in
end

post ('/authenticate') do
  @name = params.fetch("name")
  session[:message] = "Successfully logged in as #{@name}."
  valid = Patron.authenticate?(@name)
  if(valid)
    @movies = Movie.all
    redirect "/movie_list?name=#{@name}"
  else
    erb :fail
  end
end

get ('/movie_list') do
  @movies = Movie.all
  @message = session.delete(:message)
  @name = params["name"]
  erb :movie_list
end
