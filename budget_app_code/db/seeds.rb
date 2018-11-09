require_relative('../models/merchant')

merchant1 = Merchant.new({'merchant_name' => 'Sainsburys'})
merchant2 = Merchant.new({'merchant_name' => 'Asda'})
merchant3 = Merchant.new({'merchant_name' => 'Zara'})
merchant4 = Merchant.new({'merchant_name' => 'Lidl'})

merchant1.save
merchant2.save
merchant3.save
merchant4.save
