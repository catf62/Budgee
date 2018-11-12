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

  def self.all()
    sql = "SELECT * FROM budget_transactions"
    budget_transaction_data = SqlRunner.run(sql)
    transactions = map_items(budget_transaction_data)
    return transactions
  end

  def self.map_items(transaction_data)
    return transaction_data.map { |budget_transaction| BudgetTransaction.new(budget_transaction) }
  end

  def update()
    sql = "UPDATE budget_transactions
    SET budget_id = $1, transaction_id = $2
    WHERE id = $3"
    values = [budget_id, transaction_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM budget_transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM budget_transactions;"
    SqlRunner.run(sql)
  end

end
