require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Transaction
  attr_reader :id
  attr_accessor :transaction_amount, :merchant_id, :tag_id, :essential, :time_added, :total_spend

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @transaction_amount = options['transaction_amount']
    @merchant_id = options['marchant_id']
    @tag_id = options['tag_id']
    @essential = options['essential']
    @time_added = options['time_added']
    @total_spent = options['total_spent']
  end

end
