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

  def test_budget_transaction_has_budget_id
    p @budget_transaction1
    assert_equal(1, @budget_transaction1.budget_id)
  end

end
