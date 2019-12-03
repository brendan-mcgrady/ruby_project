require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('../models/tag')
require_relative('../models/merchant')
require_relative('../models/transaction')
also_reload('models/*')

# INDEX
get ('/') do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"home")
end

post ('/') do
  @transactions = Transaction.all()
  @merchants = Merchant.all()
  @tags = Tag.all()
  transaction = Transaction.new(params)
  transaction.save()
  erb(:"home")
end
# get '/transactions/:id' do
#   @transaction = find(id)
#   erb(:"transactions/show")
# end
