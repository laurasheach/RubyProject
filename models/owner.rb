require_relative("../db/sql_runner")

class Owner

  attr_accessor :first_name, :last_name, :address
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
  end

  def full_name
    return @first_name + " " + @last_name
  end

  def save()
    sql = "INSERT INTO owners (first_name, last_name, address) VALUES ($1, $2, $3) RETURNING id"
    values = [@first_name, @last_name, @address]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      first_name,
      last_name,
      address
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4
      "
      values = [@first_name, @last_name, @address, @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

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
