require('pg')
require_relative('../db/sql_runner')
require_relative('./pet_store')
  
class Pet

 def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @species = options['species']
  @age = options['age'].to_i
  @pet_stores_id = options['pet_stores_id'].to_i
 end

 def save()
  sql = "INSERT INTO pets (name, species, age) VALUES ('#{@name}', '#{@species}', '#{@age}') RETURNING *"
  pet = SqlRunner.run(sql)[0]
  result = Pet.new(pet)
  return result
 end

 def pet_store
  sql = "SELECT * FROM pet_stores WHERE id = #{@pet_stores_id}"
  pet_store = SqlRunner.run(sql)[0]
  result = PetStore.new(pet_store)
  return result
 end

 def delete
  sql = "DELETE FROM pets WHERE id = #{@id} RETURNING *;"
    pets = SqlRunner.run(sql)
    result = Pet.new(pets)
    return result
 end

 def update 
  sql = "UPDATE pets 
  SET name = '#{@name}',
      species = '#{@species}',
      age = #{@age} 
      WHERE id = #{@id}"
      pets = SqlRunner.run(sql)
      result = Pet.new(pets)
      return result
 end

 def self.find(id)
  sql = "SELECT * FROM pets WHERE id = #{id}"
  pet = SqlRunner.run(sql)[0]
  result = Pet.new(pet)
  return result
 end

 def self.all
    a
 end



end