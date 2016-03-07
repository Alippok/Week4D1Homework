require('pg')

class Store 

  attr_reader :name, :address, :stock_type, :id
  @@db_credentials = { dbname: 'pet_store_manager', host: 'localhost' }
  def initialize(options)
    @name = options["name"]
    @address = options["address"]
    @stock_type = options["stock_type"]
    @id = nil || options["id"]
  end


  def save()
    sql =  "INSERT INTO stores(
      name, 
      address, 
      stock_type )
      VALUES (
      '#{ @name }',
      '#{ @address }',
      '#{ @stock_type }' )"

    Store.run_sql( sql )
  end


  def self.find(id)
    sql = "SELECT * FROM stores WHERE id = #{id} "
    result = Store.run_sql( sql )
    stores = result.map{ |store| Store.new(store) }
    return stores.first
  end
  

  def self.all()
    sql = "SELECT * FROM stores"
    result = Store.run_sql(sql)
    @stores = result.map{|store| Store.new(store)}
    return @stores
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