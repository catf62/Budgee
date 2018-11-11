require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/budget')

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

budget1 = Budget.new({
  'budget_name' => 'May 2018',
  'budget_amount' => '500.00',
  'start_time' => '2018-05-01 04:05:06',
  'end_time' => '2018-05-30 11:59:59'
  })
budget2 = Budget.new({
  'budget_name' => 'June 2018',
  'budget_amount' => '500.00',
  'start_time' => '2018-06-01 10:05:06',
  'end_time' => '2018-06-25 11:59:59'
  })
budget3 = Budget.new({
  'budget_name' => 'Holiday in Oban',
  'budget_amount' => 400.00,
  'start_time' => '2018-07-01 00:00:00',
  'end_time' => '2018-07-01 17:00:00'
  })
budget4 = Budget.new({
  'budget_name' => 'Groceries Budget August 2018',
  'budget_amount' => 200.00,
  'start_time' => '2018-08-01 00:00:00',
  'end_time' => '2018-08-31 11:59:59'
  })

budget1.save
budget2.save
budget3.save
budget4.save
