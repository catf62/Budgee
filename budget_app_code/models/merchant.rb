require_relative( '../db/sql_runner' )

class Merchant
  attr_reader :id :merchant_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end
end
