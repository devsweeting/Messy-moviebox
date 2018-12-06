class Patron
    attr_accessor(:name)
    attr_reader(:id)

    def initialize(attributes)
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id) rescue nil

    end

    def self.all
      returned_patrons = DB.exec("SELECT * FROM patrons;")
      patrons = []
      returned_patrons.each() do |patron|
        name = patron.fetch("name")
        id = patron.fetch("id").to_i()
        patrons.push(Patron.new({:name => name, :id => id}))
    end
    patrons
  end


    def self.find(id)
     returned_patrons = DB.exec("SELECT * FROM patrons_tb WHERE id = #{id};")
     returned_patrons.each() do |patron|
       name = patrons.fetch("name")
       id = patrons.fetch("id").to_i()
       patrons.push(Movie.new({:name => name, :id => id}))
      end
    end

    def save
     result = DB.exec("INSERT INTO patrons(name) VALUES ('#{@name}') RETURNING id;")
     @id = result.first().fetch("id").to_i()
   end

   def ==(another_patron)
     self.name().==(another_patron.name())
   end

   def self.authenticate?(name)
     patrons = Patron.all
     patrons.each do |patron|
       if patron.name == name
         return true
       end
     end
     return false
   end
 end
