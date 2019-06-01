require_relative("../models/animal")
require_relative("../models/owner")
require_relative("../models/adoption")
require('pry')

animal1 = Animal.new ({
  "name" => "Bert",
  "animal_type" => "Dog",
  "breed" => "West Highland Terrier",
  "age" => 6,
  "admission_date" => "2019-06-01"
  })
animal1.save()

binding.pry
nil
