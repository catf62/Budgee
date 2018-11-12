require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Transaction
  attr_reader :id
  attr_accessor :amount, :merchant_id, :tag_id, :essential, :time_added, :total_spend
end
