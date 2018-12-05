require('spec_helper')

describe(Patron) do
  describe(".all") do
    it ("starts with no patrons") do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe("#id") do
    it ("sets its ID when you save it") do
      patron = Patron.new({:name => 'Kyle', :id => nil})
      patron.save
      expect(patron.id()).to(be_an_instance_of(Integer))
    end
  end

  describe("#save") do
    it("lets you save patrons to the database") do
        patron = Patron.new({:name => 'Kyle', :id => nil})
        patron.save
        expect(Patron.all()).to(eq([patron]))
    end
  end

  describe("#==") do
    it("is the same patron if it has the same values") do
      patron1 = Patron.new({:name => 'Steve', :id => nil})
      patron2 = Patron.new({:name => 'Steve', :id => nil})
      expect(patron1).to(eq(patron2))
      patron1.save
      patron3 = Patron.all[0]
      expect(patron1).to(eq(patron3))
    end
  end
  #
  # describe(".all_ordered") do
  #   it("retrieves items from the database sorted according to the inputted field.") do
  #     animal1 = Patron.new({:animal_id => nil, :animal_name => "Frank", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'bulldog', :owner_id => 0})
  #     animal2 = Patron.new({:animal_id => nil, :animal_name => "Beefcake", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'great dane', :owner_id => 0})
  #     animal3 = Patron.new({:animal_id => nil, :animal_name => "Clown", :animal_gender => 'male', :admittance => '2017-03-16 00:00:00', :animal_type => 'dog', :animal_breed => 'chihuahua', :owner_id => 0})
  #     animal1.save
  #     animal2.save
  #     animal3.save
  #     expect(Patron.all_ordered("name")).to(eq([animal2, animal3, animal1]))
  #     expect(Patron.all_ordered("breed")).to(eq([animal1, animal3, animal2]))
  #   end
  # end
end
