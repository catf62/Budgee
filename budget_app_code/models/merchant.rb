require_relative( '../db/sql_runner' )
require( 'pry-byebug' )

class Merchant
  attr_accessor :id, :merchant_name

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

  def self.all()
    sql = "SELECT * FROM merchants"
    merchant_data = SqlRunner.run(sql)
    merchants = map_items(merchant_data)
    return merchants
  end

  def self.map_items(merchant_data)
    return merchant_data.map { |merchant| Merchant.new(merchant) }
  end

  def update()
    sql = "UPDATE Merchants
    SET merchant_name = $1
    WHERE id = $2"
    values = [@merchant_name, @id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
