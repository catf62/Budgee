require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Budget
  attr_reader :id
  attr_accessor :budget_name, :budget_amount, :start_time, :end_time

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @budget_name = options['budget_name']
    @budget_amount = options['budget_amount']
    @start_time = options['start_time']
    @end_time = options['end_time']
  end

  def save()
    sql="INSERT INTO budgets
    (
      budget_name,
      budget_amount,
      start_time,
      end_time
    )
      VALUES
      ($1, $2, $3, $4)
      RETURNING id"
    values = [@budget_name, @budget_amount, @start_time, @end_time]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.find(id)
    sql = "SELECT * FROM budgets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    budget = Budget.new(result)
    return budget
  end

  def self.all()
    sql = "SELECT * FROM budgets"
    budget_data = SqlRunner.run(sql)
    budgets = map_items(budget_data)
    return budgets
  end

  def self.map_items(budget_data)
    return budget_data.map { |budget| Budget.new(budget) }
  end

  def update()
    p @budget2
    sql = "UPDATE budgets
    SET budget_name = $1, budget_amount = $2, start_time = $3, end_time = $4
    WHERE id = $5"
    values = [budget_name, budget_amount, start_time, end_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM budgets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM budgets;"
    SqlRunner.run(sql)
  end

end
