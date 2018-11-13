require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('controllers/budget_transactions_controller')
# require_relative('controllers/budgets_controller')
require_relative('controllers/merchants_controller')
# require_relative('controllers/tags_controller')
# require_relative('controllers/transactions_controller')

get '/' do
  erb( :index )
end
