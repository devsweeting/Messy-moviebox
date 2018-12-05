require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/movie")
require("./lib/patron")
require("pg")

DB = PG.connect({:dbname => "moviebox"})

get ('/') do
  erb :index
end
