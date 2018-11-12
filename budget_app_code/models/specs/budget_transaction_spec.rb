require('minitest/autorun')
require('minitest/rg')
require_relative('../budget_transaction')
require( 'pry-byebug' )

class BudgetTest < Minitest::Test

  def setup
    options = {
      'id' => 1,
      'budget_id' => 1,
      'transaction_id' => 1
    }

    @budget_transaction1 = BudgetTransaction.new(options)
  end

  def
  test_budget_transaction_has_budget_id
    p @budget_transaction1
    assert_equal(1, @budget_transaction1.budget_id)
  end

  # #  test for save
  #   # run seeds.rb and see if seeds appear in budget_transactions table

  # def test_find_by_id
  #   assert_equal(4, BudgetTransaction.find(2).budget_id)
  # end

  def test_self_all
    assert_equal(3, BudgetTransaction.all().last.budget_id)
  end

  def test_update
    @budget_transaction1.budget_id = 4
    @budget_transaction1.update
    assert_equal(4, @budget_transaction1.budget_id)
  end

end
