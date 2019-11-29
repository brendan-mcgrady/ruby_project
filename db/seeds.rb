require('pry')
require_relative('../models/merchant')

merchant1 = Merchant.new({ 'name' => 'Tesco'})
merchant1.save()

merchant2 = Merchant.new({ 'name' => 'Scotrail'})
merchant2.save()

binding.pry
nil
