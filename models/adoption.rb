require_relative( '../db/sql_runner' )

class Adoption

  attr_reader :animal_id, :owner_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save()
    sql = "INSERT INTO adoptions
    (
      animal_id,
      owner_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@animal_id, @owner_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    adoption_data = SqlRunner.run(sql)
    adoptions = map_items(adoption_data)
    return adoptions
  end

  def self.map_items(adoption_data)
    return adoption_data.map { |adoption| Adoption.new(adoption) }
  end

  def update()
    sql = "UPDATE adoptions
    SET
    (
      animal_id,
      owner_id
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@animal_id, @owner_id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM adoptions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def animal()
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [@animal_id]
    results = SqlRunner.run( sql, values )
    return Animal.new( results.first )
  end

  def owner()
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [@owner_id]
    results = SqlRunner.run( sql, values )
    return Owner.new( results.first )
  end


end
