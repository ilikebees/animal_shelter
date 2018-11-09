DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE animals (
  id SERIAL8 primary key,
  name VARCHAR(255)

);

CREATE TABLE owners (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),

);

CREATE TABLE adoptions (
  id SERIAL8 primary key,
  animal_id INT8 references animals(id),
  owner_id INT8 references owners(id)

);
