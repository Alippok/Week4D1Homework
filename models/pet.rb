require('pg')

class Pet
  
  attr_reader(:name, :type, :store_id, :id, :picture_url)
  @@db_credentials = { dbname: "pet_store_manager", host: "localhost"}

  def initialize(options)
    @name = options['name']
    @type = options['type']
    @store_id = options['store_id']
    @id = nil || options['id']
    @picture_url = options['picture_url']
  
  end

  def save()
    sql = "INSERT INTO pets(
      name,
      type,
      store_id,
      picture_url)
      VALUES(
      '#{@name}',
      '#{@type}',
       '#{@store_id}',
       '#{@picture_url}')"
    Store.run_sql(sql)
  end

  def store()
    sql = "SELECT * FROM stores WHERE id='#{ @store_id }'"
    result = Pet.run_sql(sql)
    return Store.new( result[0] )
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id='#{id.to_i}'"
    result = Pet.run_sql(sql)
    pets = result.map{|pet| Pet.new(pet) }
    return pets.first
  end

  def self.delete(id)
    sql = "DELETE FROM pets WHERE id='#{id}'"
    Pet.run_sql(sql)
  end

  private

  def self.run_sql(sql)
    begin
      db = PG.connect( @@db_credentials )
      result = db.exec(sql)
    ensure
      db.close
    end
    return result
  end


end