require('sinatra')
require('sinatra/contrib/all')

require_relative('models/merchant')
also_reload('models/*')
require_relative('controllers/merchant_controller.rb')

get '/' do
  erb(:"home")
end
