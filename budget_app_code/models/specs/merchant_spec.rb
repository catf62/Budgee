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

  # def test_merchant_has_name
  #   assert_equal("Sainsburys", @merchant1.merchant_name)
  # end
  #
  # def test_find_by_id
  #   assert_equal("Tesco", Merchant.find(1).merchant_name)
  # end
  #
  # def test_self_all
  #   assert_equal("Tesco", Merchant.all().first.merchant_name)
  # end

  # def test_update
  #   @merchant1.merchant_name = "Tesco"
  #   @merchant1.update
  #   assert_equal("Tesco", @merchant1.merchant_name)
  # end

binding.pry

  def test_delete_all
    Merchant.delete_all
    assert_equal (0,  Merchant.all.length)
  end
  # def test_delete
  #   assert_equal(nil, @merchant1.delete)
  # end

end


nil
