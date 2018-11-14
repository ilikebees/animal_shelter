DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE animals (
  id SERIAL8 primary key,
  name VARCHAR(255),
  admission_date VARCHAR(255),
  age VARCHAR(255),
  sex VARCHAR(255),
  breed VARCHAR(255),
  adoptable BOOLEAN,
  image_path VARCHAR(255)


);

CREATE TABLE owners (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_no VARCHAR(255)

);

CREATE TABLE adoptions (
  id SERIAL8 primary key,
  animal_id INT8 references animals(id) ON DELETE CASCADE,
  owner_id INT8 references owners(id) ON DELETE CASCADE,
  adoption_date VARCHAR(255)

);
