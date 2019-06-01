require_relative("../db/sql_runner")

class Animal

  attr_accessor :name, :name, :animal_type, :breed, :age, :admission_date
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @animal_type = options["animal_type"]
    @breed = options["breed"]
    @age = options["age"]
    @admission_date = options["admission_date"]
  end

  def save()
    sql = "INSERT INTO animals (name, animal_type, breed, age, admission_date) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @animal_type, @breed, @age, @admission_date]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

end
