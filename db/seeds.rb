require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')

Animal.delete_all()
Owner.delete_all()
Adoption.delete_all()

animal1 = Animal.new({'name' => 'Myrtle'})
animal2 = Animal.new({'name' => 'Mildred'})
animal3 = Animal.new({'name' => 'Montgomery'})
animal4 = Animal.new({'name' => 'Maeve'})

animal1.save
animal2.save
animal3.save
animal4.save

owner1 = Owner.new({'first_name' => 'Hamish', 'last_name' => 'Mackintosh'})
owner2 = Owner.new({'first_name' => 'Nicola', 'last_name' => 'Hendry'})
owner3 = Owner.new({'first_name' => 'Martin', 'last_name' => 'Rensner'})
owner4 = Owner.new({'first_name' => 'Steve', 'last_name' => 'Shanks'})

owner1.save
owner2.save
owner3.save
owner4.save

adoption1 = Adoption.new({'animal_id' => animal3.id, 'owner_id' => owner2.id})
adoption2 = Adoption.new({'animal_id' => animal1.id, 'owner_id' => owner4.id})

adoption1.save
adoption2.save


# animal1.delete
