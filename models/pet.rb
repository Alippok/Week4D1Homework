require('pg')

class Pet

  attr_reader(:name, :type, :store_id, :id)

  def initialize(options)
    @name = options['name']
    @type = options['type']
    @store_id = options['store_id']
    @id = nil || options['id']
  
  end




end