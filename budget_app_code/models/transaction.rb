require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Transaction
  attr_reader :id
  attr_accessor :transaction_amount, :merchant_id, :tag_id, :essential, :time_added, :total_spend

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @transaction_amount = options['transaction_amount'].to_f
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @essential = options['essential']
    @time_added = Time.now
    @total_spend = options['total_spend'].to_f
  end

  def save()
    sql="INSERT INTO transactions
    (
      transaction_amount,
      merchant_id,
      tag_id,
      essential,
      time_added,
      total_spend
    )
      VALUES
      ($1, $2, $3, $4, $5, $6)
      RETURNING id"
    values = [@transaction_amount, @merchant_id, @tag_id, @essential, @time_added, @total_spend]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.find(id)
    sql = "SELECT * from transactions WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    transaction = Transaction.new(result)
    return transaction
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    transaction_data = SqlRunner.run(sql)
    transactions = map_items(transaction_data)
    return transactions
  end

  def self.map_items(transaction_data)
    return transaction_data.map { |transaction| Transaction.new(transaction) }
  end

  def self.find_ids_less_equal(id)
    sql = "SELECT * FROM transactions
    WHERE id <= $1"
    values = [id]
    transaction_data = SqlRunner.run(sql, values)
    transactions = map_items(transaction_data)
    return transactions
  end

  def self.transactions_total()
    transactions = self.all()
    transactions_total = 0
    transactions.each { |transaction| transactions_total += transaction.transaction_amount}
    return transactions_total
  end


end
