require('pg')

class Store 

  attr_reader :name, :address, :stock_type, :id

  def initialize(options)
    @name = options["name"]
    @address = options["address"]
    @stock_type = options["stock_type"]
    @id = nil || options["id"]
  end










end