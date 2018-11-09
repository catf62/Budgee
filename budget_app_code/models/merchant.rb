require_relative( '../db/sql_runner' )

class Merchant
  attr_reader :id, :merchant_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end

  def save()
    sql="INSERT INTO merchants
    (
      merchant_name
    )
      VALUES
      ($1)
      RETURNING id"
    values = [@merchant_name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    merchant = Merchant.new(result)
    return merchant
  end

end
