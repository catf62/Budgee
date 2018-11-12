require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')
require( 'pry-byebug' )

class TransactionTest < Minitest::Test

  def setup
    options = {
      'id' => 1,
      'transaction_amount' => 5.00,
      'merchant_id' => 1,
      'tag_id' => 1,
      'essential' => 'Y',
      'total_spent' => 5.00
    }
    @transaction1 = Transaction.new(options)
  end

  def test_transaction_has_amount
    p @transaction1
    assert_equal(5.00, @transaction1.transaction_amount)
  end

  def test_transaction_has_time_added
  puts  @transaction1.time_added
  end

end
