require_relative("../db/sql_runner")

class Animal

  attr_accessor :name, :name, :animal_type, :breed, :age, :admission_date, :adoption_status
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @animal_type = options['animal_type']
    @breed = options['breed']
    @age = options['age']
    @admission_date = options['admission_date']
    @adoption_status = options['adoption_status']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      animal_type,
      breed,
      age,
      admission_date,
      adoption_status
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @animal_type, @breed, @age, @admission_date, @adoption_status]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      animal_type,
      breed,
      age,
      admission_date,
      adoption_status
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@name, @animal_type, @breed, @age, @admission_date, @adoption_status, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def animals_by_admission_date()
    sql = "SELECT * FROM animals
    ORDER BY admission_date"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end

  def owners()
    sql = "SELECT owners.* FROM owners
    INNER JOIN adoptions
    ON adoptions.owner_id = owners.id
    WHERE adoptions.animal_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|owner| Owner.new(owner)}
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run(sql)
    return results.map {|animal| Animal.new(animal)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = $1 "
    values = [id]
    result = SqlRunner.run(sql, values)
    return Animal.new(result.first)
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

end
