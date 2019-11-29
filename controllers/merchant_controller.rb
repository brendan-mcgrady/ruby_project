require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/merchant')
also_reload('models/*')

# INDEX
get ('/merchants') do
  @merchants = Merchant.all()
  erb(:"merchants/index")
end
