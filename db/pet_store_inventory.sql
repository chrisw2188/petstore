CREATE TABLE pet_stores(
  id SERIAL4 primary key, 
  name VARCHAR(255),
  location VARCHAR(255), 
  stock_type VARCHAR(255)
    );

CREATE TABLE pets(
  id SERIAL4 primary key, 
  name VARCHAR(255),
  species VARCHAR(255),
  age INT2,
  pet_stores_id INT4 REFERENCES pet_stores(id)
)

