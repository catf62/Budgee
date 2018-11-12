require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class BudgetTransaction
  attr_reader :id
  attr_accessor :budget_id, :transaction_id

  def initialize ( options )
    @id = options['id'].to_i if options['id']
    @budget_id = options['budget_id'].to_i
    @transaction_id = options['transaction_id'].to_i
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

  def self.find(id)
    sql = "SELECT * FROM budget_transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    budget_transactions = BudgetTransaction.new(result)
    return budget_transactions
  end

end
