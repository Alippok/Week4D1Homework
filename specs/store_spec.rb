require('minitest/autorun')
require('minitest/rg')
require_relative('../models/store.rb')


class TestStore < MiniTest::Test

  def setup
  
  @store = Store.new(name: "Allan's Pets", address:"1/3 Horwich Lane", stock_type: "fish")

  end

  
  def test_name

  end







end