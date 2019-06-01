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

end
