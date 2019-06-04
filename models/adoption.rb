require_relative("../db/sql_runner")

class Adoption

  attr_accessor :owner_id, :animal_id, :adoption_date
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @owner_id = options['owner_id'].to_i
    @animal_id = options['animal_id'].to_i
    @adoption_date = options['adoption_date']
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      owner_id,
      animal_id,
      adoption_date
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@owner_id, @animal_id, @adoption_date]
    results = SqlRunner.run(sql, values).first()
    @id = results['id'].to_i
  end

  def update()
    sql = "UPDATE adoptions
    SET
    (
      owner_id,
      animal_id,
      adoption_date
    ) =
    (
      $1, $2, $3
    )
      WHERE id = $4"
    values = [@owner_id, @animal_id, @adoption_date, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run(sql, values)
    return Owner.new(results.first)
  end

  def animal()
    sql = "SELECT * from animals
    WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run(sql, values)
    return Animal.new(results.first)
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    result = SqlRunner.run(sql)
    return result.map {|adoption| Adoption.new(adoption)}
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Adoption.new(result.first)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

end
