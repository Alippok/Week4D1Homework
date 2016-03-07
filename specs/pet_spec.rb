require('minitest/autorun')
require('minitest/rg')
require_relative('../models/pet.rb')

class TestPet < MiniTest::Test

  def setup 

  @pet = Pet.new("name" => "Bobby", "type" => "goldfish", "store_id" =>"store_id")

  end
  
  def test_name
    assert_equal("goldfish", @pet.type)
  end


end