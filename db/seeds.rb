require('pry')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

merchant1 = Merchant.new({ 'name' => 'Tesco'})
merchant1.save()

merchant2 = Merchant.new({ 'name' => 'Scotrail'})
merchant2.save()

tag1 = Tag.new({ 'name' => 'Groceries' })
tag1.save()

tag2 = Tag.new({ 'name' => 'Transport' })
tag2.save()

tag3 = Tag.new({ 'name' => 'Entertainment' })
tag3.save()

tag4 = Tag.new({ 'name' => 'Business' })
tag4.save()

transaction1 = Transaction.new({
  'merch_id' => merchant1.id(),
  'tag_id' => tag1.id(),
  'amount' => 23.669
   })
transaction1.save()

Merchant.delete_all()
Tag.delete_all()

binding.pry
nil
