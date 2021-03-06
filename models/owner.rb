require_relative("../db/sql_runner")

class Owner

  attr_accessor :full_name, :address
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @full_name = options['full_name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO owners (full_name, address) VALUES ($1, $2) RETURNING id"
    values = [@full_name, @address]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      full_name,
      address
      ) =
      (
        $1, $2
      )
      WHERE id = $3
      "
      values = [@full_name, @address, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def animals
    sql = "SELECT animals.name FROM animals
     INNER JOIN adoptions
     ON adoptions.animal_id = animals.id
     WHERE owner_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |animal| Animal.new(animal) }
  end

  # def owners_with_animals()
  #   sql = "SELECT owners.first_name, owners.last_name, animals.name FROM owners
  #   INNER JOIN adoptions
  #   ON adoptions.owner_id = owners.id
  #   INNER JOIN animals
  #   ON animals.id = adoptions.animal_id"
  #   values = []
  #   result = SqlRunner.run(sql, values)
  #   return result.map {|owner| Owner.new(owner)}
  # end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run(sql)
    return results.map {|owner| Owner.new(owner)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Owner.new(result.first)
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

end
