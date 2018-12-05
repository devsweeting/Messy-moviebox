class Movie
  attr_accessor(:title, :actors, :genre, :checkedout)
  attr_reader(:id)

  def intialize(attributes)
    @title = attributes.fetch(:title)
    @actors = attributes.fetch(:actors)
    @genre = attributes.fetch(:genre)
    @id = attributes.fetch(:id) rescue nil
    @checkedout = false
  end

  def self.all_basic(movies)
    # output_movies = []
    movies.each() do |movie|
      title = movies.fetch("title")
      actors = movies.fetch("actors")
      genre = movies.fetch("genre")
      checkedout = movies.fetch("checkedout")
      id = movies.fetch("id").to_i()
    temp_movie = Movie.new({:title => title, :actors => actors, :genre => genre, :checkedout => checkedout, :id => id})

  def self.all
    returned_movies = DB.exec("SELECT * FROM movies;")
    Movie.all_basic(returned_movies, true)
  end


  def self.find(id)
   returned_movies = DB.exec("SELECT * FROM movies_tb WHERE id = #{id};")
   returned_movies.each() do |movie|
     title = movies.fetch("title")
     actors = movies.fetch("actors")
     genre = movies.fetch("genre")
     checkedout = movies.fetch("checkedout")
     id = movies.fetch("id").to_i()
     return movies.push(Movie.new({:title => title, :actors => actors, :genre => genre, :checkedout => checkedout, :id => id}))
    end
  end

  def save
   result = DB.exec("INSERT INTO movies(title, actors, genre, checkedout) VALUES ('#{@title}', '#{@actors}', '#{@genre}' #{checkedout}) RETURNING id;")
   @id = result.first().fetch("id").to_i()
 end

 def ==(another_movie)
   self.title().==(another_movie.title()).&(self.actors().==(another_movie.actors())).&(self.genre().==(another_movie.genre())).&(self.checkedout().==(another_movie.checkedout()))
 end

end
