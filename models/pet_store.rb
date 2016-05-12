require('pg')
require_relative('../db/sql_runner')
require_relative('./pets')

class PetStore

  attr_accessor(:id, :name, :location, :stock_type)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @location = options['location']
    @stock_type = options['stock_type']
  end

  def save()
    sql = "INSERT INTO pet_stores (name, location, stock_type) VALUES ( '#{name}', '#{location}', '#{stock_type}' ) RETURNING *"
      pet_store = SqlRunner.run(sql)[0]
      result = PetStore.new (pet_store)
      return result
  end

  def pets
   sql = "SELECT * FROM pets WHERE pet_stores_id = #{@id}"
   pets = SqlRunner.run(sql)
   result = pets.map { |pet| pet.new(pets) }
   return result
  end



end