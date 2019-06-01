require_relative("../db/sql_runner")

class Adoption

  attr_accessor :adoption_status, :owner_id, :animal_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @adoption_status = options['adoption_status']
    @owner_id = options['owner_id'].to_i
    @animal_id = options['animal_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      adoption_status,
      owner_id,
      animal_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@adoption_status, @owner_id, @animal_id]
    results = SqlRunner.run(sql, values).first()
    @id = results['id'].to_i
  end

  def update()
    sql = "UPDATE adoptions
    SET
    (
      adoption_status,
      owner_id,
      animal_id
    ) =
    (
      $1, $2, $3
    )
      WHERE id = $4"
    values = [@adoption_status, @owner_id, @animal_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
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
