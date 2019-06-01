DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;


CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  animal_type VARCHAR(255),
  breed VARCHAR(255),
  age INT,
  admission_date DATE
);

CREATE TABLE adoptions (
  id SERIAL8 PRIMARY KEY,
  adoption_status VARCHAR(255),
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE
);
