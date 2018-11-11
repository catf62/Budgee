require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Budget
  attr_reader :id
  attr_accessor :budget_name, :start_time, :end_time

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
      start_time,
      end_time
    )
      VALUES
      ($1, $2, $3)
      RETURNING id"
    values = [@budget_name, @start_time, @end_time]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
