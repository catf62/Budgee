require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/budget.rb' )
also_reload( '../models/*' )

get '/budgets' do
  @budgets = Budget.all()
  erb ( :"budgets/index" )
end

get '/budgets/new' do
  erb ( :"budgets/new" )
end

post '/budgets' do # create
  budget = Budget.new( params )
  budget.save()
  redirect to( "budgets" )
end
