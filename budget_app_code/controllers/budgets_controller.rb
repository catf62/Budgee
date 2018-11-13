require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget.rb' )
also_reload( '../models/*' )

get '/budgets' do
  "Hello World"
end
