require_relative( '../db/sql_runner' )

class Animal
  attr_reader :id, :name, :admission_date, :age, :sex, :image_path

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @admission_date = options['admission_date']
    @age = options['age']
    @sex = options['sex']
    @image_path = options['image_path']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      admission_date,
      age,
      sex,
      image_path
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @admission_date, @age, @sex, @image_path]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal) }
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      admission_date,
      age,
      sex,
      image_path
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @admission_date, @age, @sex, @image_path]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    animal = Animal.new(result)
    return animal
  end

  def format_name
    return "#{@name.capitalize}"
  end


end
