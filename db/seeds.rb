require_relative("../models/owner")
require_relative("../models/animal")
require_relative("../models/adoption")
require('pry')

Owner.delete_all()
Animal.delete_all()
Adoption.delete_all()

owner1 = Owner.new({
  'full_name' => 'Laura Sheach',
  'address' => '1 Park Way, Glasgow, G1 2AB'
  })
owner1.save()

owner2 = Owner.new({
  'full_name' => 'Harris McFarlane',
  'address' => '2 Old Street, Glasgow, G2 3CD'
  })
owner2.save()

owner3 = Owner.new({
  'full_name' => 'Eunice McDonald',
  'address' => '3 High Street, Glasgow, G3 4EF'
  })
owner3.save()

owner4 = Owner.new({
  'full_name' => 'Billy Ford',
  'address' => '4 Edinburgh Road, Glasgow, G4 5GH'
  })
owner4.save()

animal1 = Animal.new({
  'name' => 'Bert',
  'animal_type' => 'Dog',
  'breed' => 'West Highland Terrier',
  'age' => 6,
  'admission_date' => '2019-06-01',
  'adoption_status' => 'Unavailable',
  'animal_url' => "/public/images/bert.jpg"
  })
animal1.save()

animal2 = Animal.new({
  'name' => 'Snuggles',
  'animal_type' => 'Chinchilla',
  'breed' => 'Chinchilla Lanigera',
  'age' => 2,
  'admission_date' => '2019-05-03',
  'adoption_status' => 'Unavailable',
  'animal_url' => 'snuggles.jpg'
  })
animal2.save()

animal3 = Animal.new({
  'name' => 'Gary',
  'animal_type' => 'Cat',
  'breed' => 'Sphynx',
  'age' => 4,
  'admission_date' => '2019-04-15',
  'adoption_status' => 'Available',
  'animal_url' => 'gary.jpg'
  })
animal3.save()

animal4 = Animal.new({
  'name' => 'Scoot',
  'animal_type' => 'Tortoise',
  'breed' => 'Mediterranean Spur-thighed',
  'age' => 14,
  'admission_date' => '2019-02-28',
  'adoption_status' => 'Available',
  'animal_url' => 'scoot.jpg'
  })
animal4.save()


adoption1 = Adoption.new({
  'owner_id' => owner1.id,
  'animal_id' => animal2.id
  })
adoption1.save()

adoption2 = Adoption.new({
  'owner_id' => owner2.id,
  'animal_id' => animal1.id
  })
adoption2.save()

binding.pry
nil
