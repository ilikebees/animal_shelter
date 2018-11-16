require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')

Adoption.delete_all()
Animal.delete_all()
Owner.delete_all()


animal1 = Animal.new({'name' => 'Myrtle', 'admission_date' => '01-04-2018', 'age' => '5', 'sex' => 'female', 'breed' => 'Basset Hound', 'adoptable' => false, 'image_path' => '/images/dog1.png'})
animal2 = Animal.new({'name' => 'Mildred', 'admission_date' => '11-07-2018', 'age' => '12', 'sex' => 'female', 'breed' => 'Spaniel', 'adoptable' => false, 'image_path' => '/images/dog2.png'})
animal3 = Animal.new({'name' => 'Montgomery', 'admission_date' => '03-05-2018', 'age' => '1', 'sex' => 'male', 'breed' => 'Tabby', 'adoptable' => false, 'image_path' => '/images/cat.png'})
animal4 = Animal.new({'name' => 'Maeve', 'admission_date' => '23-06-2018', 'age' => '8', 'sex' => 'female', 'breed' => 'Husky', 'adoptable' => false, 'image_path' => '/images/dog3.png'})

animal1.save
animal2.save
animal3.save
animal4.save

owner1 = Owner.new({'first_name' => 'Stewart', 'last_name' => 'Campbell', 'contact_no' => '07804763704'})
owner2 = Owner.new({'first_name' => 'Isobel', 'last_name' => 'Murdoch', 'contact_no' => '07724233584'})
owner3 = Owner.new({'first_name' => 'David', 'last_name' => 'Jones', 'contact_no' => '07804632294'})
owner4 = Owner.new({'first_name' => 'Alec', 'last_name' => 'Morrison', 'contact_no' => '07724163904'})


owner1.save
owner2.save
owner3.save
owner4.save

adoption1 = Adoption.new({'animal_id' => animal3.id, 'owner_id' => owner2.id, 'adoption_date' => '25-10-2018'})
adoption2 = Adoption.new({'animal_id' => animal1.id, 'owner_id' => owner4.id, 'adoption_date' => '02-08-2018'})

adoption1.save
adoption2.save
