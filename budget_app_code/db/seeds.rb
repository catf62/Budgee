require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/budget')
require_relative('../models/transaction')
require_relative('../models/budget_transaction')

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
  'budget_amount' => 500.00,
  'start_time' => '2018-05-01 04:05:06',
  'end_time' => '2018-05-30 11:59:59'
})
budget2 = Budget.new({
  'budget_name' => 'June 2018',
  'budget_amount' => 500.00,
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

transaction1 = Transaction.new({
  'transaction_amount' => 5.00,
  'merchant_id' => 4,
  'tag_id' => 1,
  'essential' => 'Y',
  'total_spend' => 5.00
})
transaction2 = Transaction.new({
  'transaction_amount' => 60.00,
  'merchant_id' => 1,
  'tag_id' => 1,
  'essential' => 'Y',
  'total_spend' => 65.00
})
transaction3 = Transaction.new({
  'transaction_amount' => 100.00,
  'merchant_id' => 3,
  'tag_id' => 2,
  'essential' => 'N',
  'total_spend' => 165.00
})
transaction4 = Transaction.new({
  'transaction_amount' => 35.00,
  'merchant_id' => 1,
  'tag_id' => 2,
  'essential' => 'Y',
  'total_spend' => 200.00
})

  transaction1.save
  transaction2.save
  transaction3.save
  transaction4.save

budget_transaction1 = BudgetTransaction.new({
  'budget_id' => 1,
  'transaction_id' => 1
})
budget_transaction2 = BudgetTransaction.new({
  'budget_id' => 4,
  'transaction_id' => 2
})
budget_transaction3 = BudgetTransaction.new({
  'budget_id' => 2,
  'transaction_id' => 2
})
budget_transaction4 = BudgetTransaction.new({
  'budget_id' => 3,
  'transaction_id' => 2
})

budget_transaction1.save
budget_transaction2.save
budget_transaction3.save
budget_transaction4.save
