require_relative("../models/owner")
require_relative("../models/animal")
require_relative("../models/adoption")
require('pry')

Owner.delete_all()
Animal.delete_all()
Adoption.delete_all()

owner1 = Owner.new({
  'first_name' => 'Laura',
  'last_name' => 'Sheach',
  'address' => '1 Park Way, Glasgow, G1 2AB'
  })
owner1.save()

owner2 = Owner.new({
  'first_name' => 'Harris',
  'last_name' => 'McFarlane',
  'address' => '2 Old Street, Glasgow, G2 3CD'
  })
owner2.save()


animal1 = Animal.new({
  'name' => 'Bert',
  'animal_type' => 'Dog',
  'breed' => 'West Highland Terrier',
  'age' => 6,
  'admission_date' => '2019-06-01'
  })
animal1.save()

animal2 = Animal.new({
  'name' => 'Snuggles',
  'animal_type' => 'Chinchilla',
  'breed' => 'Chinchilla Lanigera',
  'age' => 2,
  'admission_date' => '2019-05-03'
  })
animal2.save()


adoption1 = Adoption.new({
  'adoption_status' => 'Unavailable',
  'owner_id' => owner1.id,
  'animal_id' => animal2.id
  })
adoption1.save()

adoption2 = Adoption.new({
  'adoption_status' => 'Unavailable',
  'owner_id' => owner2.id,
  'animal_id' => animal1.id
  })
adoption2.save()


binding.pry
nil