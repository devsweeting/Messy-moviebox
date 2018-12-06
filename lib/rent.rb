class Rent




def rented(id)
DB.exec("UPDATE animals SET owner_id = #{owner_id} WHERE id = #{@animal_id}")
end

end 
