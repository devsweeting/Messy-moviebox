require('spec_helper')

describe(Movie) do
  describe(".all") do
    it ("starts with no movies") do
      expect(Movie.all()).to(eq([]))
    end
  end

  describe("#movie_id") do
    it("sets its ID when you save it") do
      movie = Movie.new({:title => "The Commuter", :actors => "Liam Neeson", :genre=> 'Drama', :checkedout => false, :id => nil})
      movie.save
      expect(movie.id()).to(be_an_instance_of(Integer))
    end
  end

  # describe("#save") do
  #   it("lets you save animals to the database") do
  #     animal = Movie.new({:animal_id => nil, :animal_name => "Frank", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'bulldog', :owner_id => 0})
  #     animal.save
  #     expect(Movie.all()).to(eq([animal]))
  #   end
  # end
  #
  # describe("#==") do
  #   it("is the same animal if it has the same values") do
  #     animal1 = Movie.new({:animal_id => nil, :animal_name => "Frank", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'bulldog', :owner_id => 0})
  #     animal2 = Movie.new({:animal_id => nil, :animal_name => "Frank", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'bulldog', :owner_id => 0})
  #     expect(animal1).to(eq(animal2))
  #     animal1.save
  #     animal3 = Movie.all[0]
  #     expect(animal1).to(eq(animal3))
  #   end
  # end
  #
  # describe(".all_ordered") do
  #   it("retrieves items from the database sorted according to the inputted field.") do
  #     animal1 = Movie.new({:animal_id => nil, :animal_name => "Frank", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'bulldog', :owner_id => 0})
  #     animal2 = Movie.new({:animal_id => nil, :animal_name => "Beefcake", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'great dane', :owner_id => 0})
  #     animal3 = Movie.new({:animal_id => nil, :animal_name => "Clown", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'chihuahua', :owner_id => 0})
  #     animal1.save
  #     animal2.save
  #     animal3.save
  #     expect(Movie.all_ordered("name")).to(eq([animal2, animal3, animal1]))
  #     expect(Movie.all_ordered("breed")).to(eq([animal1, animal3, animal2]))
  #   end
  # end
end
