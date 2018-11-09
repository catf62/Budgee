require('minitest/autorun')
require('minitest/rg')
require_relative('../merchant')
require( 'pry-byebug' )

class MerchantTest < Minitest::Test



  def setup
    options = {
      'id' => 1,
      'merchant_name' => 'Sainsburys'
    }

    @merchant1 = Merchant.new(options)
  end

  def test_merchant_has_name
    assert_equal("Sainsburys", @merchant1.merchant_name)
  end

  def test_find_by_id
    assert_equal("Sainsburys", Merchant.find(1).merchant_name)
  end

  def test_self_all
    assert_equal("Sainsburys", Merchant.all().first.merchant_name)
  end




end

binding.pry
nil
