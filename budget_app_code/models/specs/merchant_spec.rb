require('minitest/autorun')
require('minitest/rg')
require_relative('../merchant')
require( 'pry-byebug' )

class MerchantTest < Minitest::Test



  def setup
    options = {
      'id' => 13,
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



  # def test_delete_all
  #   p Merchant.delete_all
  # end
  # def test_delete
  #   @merchant1.delete
  # end

end

binding.pry
nil
