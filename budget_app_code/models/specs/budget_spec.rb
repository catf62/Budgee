require('minitest/autorun')
require('minitest/rg')
require_relative('../budget')
require( 'pry-byebug' )

class BudgetTest < Minitest::Test

  def setup
    options = {
      'id' => 1,
      'budget_name' => 'May 2018',
      'budget_amount' => '500.00',
      'start_time' => '2018-01-05 04:05:06',
      'end_time' => '2018-05-30 11:59:59'
    }

    @budget1 = Budget.new(options)
  end

  # def test_budget_has_name
  #   p @budget1
  #   assert_equal("May 2018", @budget1.budget_name)
  # end

  # #  test for save
  #   # run seeds.rb and see if seeds appear in tags table

  # def test_find_by_id
  #   assert_equal("May 2018", Budget.find(1).budget_name)
  # end

  # def test_self_all
  #   assert_equal("Groceries Budget August 2018", Budget.all().last.budget_name)
  # end

  # def test_update
  #   @budget1.budget_name = "Christmas"
  #   @budget1.update
  #   assert_equal("Christmas", @budget1.budget_name)
  # end

  def test_delete
    @budget1.delete
  end

end

# binding.pry
# nil
