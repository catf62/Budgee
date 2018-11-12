require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')
require( 'pry-byebug' )

class TransactionTest < Minitest::Test

  def setup
    options = {
      'id' => 4,
      'transaction_amount' => 35.00,
      'merchant_id' => 1,
      'tag_id' => 2,
      'essential' => 'Y'
    }
    @transaction4 = Transaction.new(options)
  end

  # def test_transaction_has_amount
  #   p @transaction1
  #   assert_equal(5.00, @transaction1.transaction_amount)
  # end
  #
  # def test_transaction_has_time_added
  # puts  @transaction1.time_added
  # end

  # #  test for save
  #   # run seeds.rb and see if seeds appear in tags table

  # def test_find_by_id
  #   assert_equal(35.00, Transaction.find(4).transaction_amount)
  # end

  # def test_select_by_less_than_or_equal_to_id
  #   assert_equal(35, Transaction.find_ids_less_equal(@transaction4.id).last.transaction_amount)
  # end

  # def test_all_transactions_total
  #   assert_equal(200, Transaction.all_transactions_total)
  # end

  # def test_transactions_total__trans_4
  #   assert_equal(200, Transaction.transactions_total_by_id(@transaction4.id))
  # end
  #
  # def test_transactions_total__trans_3
  #     assert_equal(165, Transaction.transactions_total_by_id(3))
  #   end

  # def test_self_all
  #   assert_equal(35, Transaction.all().last.transaction_amount)
  # end

  def test_update
    @transaction4.transaction_amount = 101.99
    @transaction4.update
    assert_equal(101.99, @transaction4.transaction_amount)
  end


end

nil
