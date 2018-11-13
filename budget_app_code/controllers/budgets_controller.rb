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

get '/budgets/:id' do # show
  @budget = Budget.find( params[:id] )
  erb(:"budgets/show")
end

post '/budgets/:id/delete' do
  @budget = Budget.find( params[:id] )
  @budget.delete()
  redirect to "budgets"
end


# EDIT
get '/budgets/:id/edit' do
  @budget = Budget.find(params[:id])
  erb(:"budgets/edit")
end

# UPDATE
post '/budgets/:id' do
  budget = Budget.new( params )
  budget.update
  redirect to 'budgets/' + params[:id]
end
