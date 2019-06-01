require_relative("../db/sql_runner")

class Animal

  attr_accessor :name, :name, :animal_type, :breed, :age, :admission_date
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @animal_type = options['animal_type']
    @breed = options['breed']
    @age = options['age']
    @admission_date = options['admission_date']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      animal_type,
      breed,
      age,
      admission_date
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @animal_type, @breed, @age, @admission_date]
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
      admission_date
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@name, @animal_type, @breed, @age, @admission_date, @id]
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
