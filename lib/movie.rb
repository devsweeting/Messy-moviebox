class Movie
  attr_accessor(:title, :actors, :genre, :checkedout)
  attr_reader(:id)

  def initialize(attributes)
    @title = grammar(attributes.fetch(:title))
    @actors = [attributes.fetch(:actors)]
    @genre = grammar(attributes.fetch(:genre))
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

  def update(attributes)
    @title = attributes.fetch(:title)
    @actors = attributes.fetch(:actors)
    @genre = attributes.fetch(:genre)
    @id = self.id()
    DB.exec("UPDATE movies SET title = '#{@title}' WHERE id = #{@id};")
    DB.exec("UPDATE movies SET actors = '#{@actors}' WHERE id = #{@id};")
    DB.exec("UPDATE movies SET genre = '#{@genre}' WHERE id = #{@id};")
  end

  def self.find(id)
    returned_movies = DB.exec("SELECT * FROM movies WHERE id = #{id};")
    return_movie = nil
    returned_movies.each() do |movie|
      title = movie.fetch("title")
      actors = movie.fetch("actors")
      genre = movie.fetch("genre")
      checkedout = false
      if(movie.fetch("checkedout") == "t")
        checkedout = true
      end
      id = movie.fetch("id").to_i()
      return_movie = Movie.new({:title => title, :actors => actors, :genre => genre, :checkedout => checkedout, :id => id})
    end
    return_movie
  end

  def save
    result = DB.exec("INSERT INTO movies(title, actors, genre, checkedout) VALUES ('#{@title}', '#{@actors}', '#{@genre}', #{@checkedout}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def delete
    DB.exec("DELETE FROM movies WHERE id = #{self.id()};")
  end

  def ==(another_movie)
    self.title().==(another_movie.title()).&(self.actors().==(another_movie.actors())).&(self.genre().==(another_movie.genre())).&(self.checkedout().==(another_movie.checkedout()))
  end

  def grammar (input)
    input.split.map(&:capitalize).join(' ')
  end

  def add_actor
    @actors.push(attributes)
  end
end
