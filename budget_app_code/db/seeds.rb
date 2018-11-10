require_relative('../models/merchant')
require_relative('../models/tag')

merchant1 = Merchant.new({'merchant_name' => 'Sainsburys'})
merchant2 = Merchant.new({'merchant_name' => 'Asda'})
merchant3 = Merchant.new({'merchant_name' => 'Zara'})
merchant4 = Merchant.new({'merchant_name' => 'Lidl'})

merchant1.save
merchant2.save
merchant3.save
merchant4.save

tag1 = Tag.new({'tag_name' => 'Groceries'})
tag2 = Tag.new({'tag_name' => 'Clothing'})
tag3 = Tag.new({'tag_name' => 'Entertainment'})
tag4 = Tag.new({'tag_name' => 'Travel'})

tag1.save
tag2.save
tag3.save
tag4.save
