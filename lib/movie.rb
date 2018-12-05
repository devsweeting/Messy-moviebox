class Movie
  attr_accessor(:title, :actors, :genre, :checkedout)
  attr_reader(:id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @actors = attributes.fetch(:actors)
    @genre = attributes.fetch(:genre)
    @id = attributes.fetch(:id) rescue nil
    @checkedout = false
  end

  def self.all
    returned_movies = DB.exec("SELECT * FROM movies;")
    movies = []
    returned_movies.each() do |movie|
      title = movie.fetch("title")
      actors = movie.fetch("actors")
      genre = movie.fetch("genre")
      checkedout = movie.fetch("checkedout")
      id = movie.fetch("id").to_i()
      movies.push(Movie.new({:title => title, :actors => actors, :genre => genre, :checkedout => checkedout, :id => id}))
  end
  movies
end


  def self.find(id)
   returned_movies = DB.exec("SELECT * FROM movies_tb WHERE id = #{id};")
   returned_movies.each() do |movie|
     title = movies.fetch("title")
     actors = movies.fetch("actors")
     genre = movies.fetch("genre")
     checkedout = false
     if(movies.fetch("checkedout") == "t")
       checkedout = true
     end
     id = movies.fetch("id").to_i()
     return movies.push(Movie.new({:title => title, :actors => actors, :genre => genre, :checkedout => checkedout, :id => id}))
    end
  end

  def save
   result = DB.exec("INSERT INTO movies(title, actors, genre, checkedout) VALUES ('#{@title}', '#{@actors}', '#{@genre}', #{@checkedout}) RETURNING id;")
   @id = result.first().fetch("id").to_i()
 end

 def ==(another_movie)
   self.title().==(another_movie.title()).&(self.actors().==(another_movie.actors())).&(self.genre().==(another_movie.genre())).&(self.checkedout().==(another_movie.checkedout()))
 end

end
