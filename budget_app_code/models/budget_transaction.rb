require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class BudgetTransaction
  attr_reader :id
  attr_accessor :budget_id, :transaction_id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @budget_id = options['budget_id']
    @transaction_id = options['transaction_id']
  end

  def save()
    sql="INSERT INTO budget_transactions
    (
      budget_id,
      transaction_id
    )
      VALUES
      ($1, $2)
      RETURNING id"
    values = [@budget_id, @transaction_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

end
