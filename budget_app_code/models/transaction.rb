require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Transaction
  attr_reader :id
  attr_accessor :transaction_amount, :merchant_id, :tag_id, :essential, :time_added, :total_spend

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @transaction_amount = options['transaction_amount']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @essential = options['essential']
    @time_added = Time.now
    @total_spend = options['total_spend']
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

end
