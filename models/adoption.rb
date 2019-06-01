require_relative("../db/sql_runner")

class Adoption

  attr_accessor :adoption_status, :animal_id, :owner_id
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @adoption_status = options["adoption_status"]
    @animal_id = options["animal_id"].to_i
    @owner_id = options["owner_id"].to_i
  end

end
