require_relative("../db/sql_runner")

class Owner

  attr_accessor :first_name, :last_name, :address
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @address = options["address"]
  end

  def full_name
    return @first_name + " " + @last_name
  end

end
