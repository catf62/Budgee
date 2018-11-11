require('minitest/autorun')
require('minitest/rg')
require_relative('../budget')
require( 'pry-byebug' )

class BudgetTest < Minitest::Test

  def setup
    options = {
      'id' => 1,
      'budget_name' => 'May 2018',
      'start_time' => '2018-01-05 04:05:06',
      'end_time' => '2018-30-05 11:59:59',
    }

    @budget1 = Budget.new(options)
  end

    def test_budget_has_name
      p @budget1
      assert_equal("May 2018", @budget1.budget_name)
    end

end
