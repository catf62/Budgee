require_relative( '../db/sql_runner' )
require( 'pry-byebug' )
require_relative('merchant')
require_relative('tag')

class Transaction
  attr_reader :id
  attr_accessor :transaction_amount, :merchant_id, :tag_id, :essential, :time_added

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @transaction_amount = options['transaction_amount'].to_f
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @essential = options['essential']
    @time_added = options['time_added']
  end

  def save()
    sql="INSERT INTO transactions
    (
      transaction_amount,
      merchant_id,
      tag_id,
      essential,
      time_added
    )
      VALUES
      ($1, $2, $3, $4, $5)
      RETURNING id"
    values = [@transaction_amount, @merchant_id, @tag_id, @essential, @time_added]
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

  def self.all_transactions_total()
    transactions = self.all()
    transactions_total = 0
    transactions.each { |transaction| transactions_total += transaction.transaction_amount}
    return transactions_total
  end

  def self.transactions_total_by_id(id)
    transactions = self.find_ids_less_equal(id)
    transactions_total = 0
    transactions.each { |transaction| transactions_total += transaction.transaction_amount}
    return transactions_total
  end

  def update()
    p @budget2
    sql = "UPDATE transactions
    SET transaction_amount = $1, merchant_id = $2, tag_id = $3, essential = $4, time_added = $5
    WHERE id = $6"
    values = [transaction_amount, merchant_id, tag_id, essential, time_added, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def merchant()
    merchant = Merchant.find(@merchant_id)
    return merchant
  end

  def tag()
    tag = Tag.find(@tag_id)
    return tag
  end


end
