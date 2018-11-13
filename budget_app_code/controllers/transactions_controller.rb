require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction.rb' )
also_reload( '../models/*' )

get '/transactions' do
    @transactions = Transaction.all()
    erb ( :"transactions/index" )
end


get '/transactions/new' do
  erb ( :"transactions/new" )
end

post '/transactions' do # create
  transaction = Transaction.new( params )
  transaction.save()
  redirect to( "transactions" )
end

get '/transactions/:id' do # show
  @transaction = Transaction.find( params[:id] )
  erb(:"transactions/show")
end

post '/transactions/:id/delete' do
  @transaction = Transaction.find( params[:id] )
  @transaction.delete()
  redirect to "transactions"
end

# EDIT
get '/transactions/:id/edit' do
  @essentials = ['Essential', 'Could Manage Without', 'Money Muching Nonsense!']
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/edit")
end

# UPDATE
post '/transactions/:id' do
  transaction = Transaction.new( params )
  transaction.update
  redirect to 'transactions'
end
