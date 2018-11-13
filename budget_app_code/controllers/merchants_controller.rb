require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant.rb' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all()
  erb ( :"merchants/index" )
end

# get '/merchants/:id' do
#   @merchant = Merchant.find(params['id'].to_i)
#   erb( :"merchants/show" )
# end

# SHOW
get '/merchants/:id' do
  @merchant = Merchant.find(params[:id])
  erb(:show)
end

get '/merchants/new' do
  erb ( :"merchants/new" )
end

post '/merchants' do # create
  merchant = Merchant.new( params )
  merchant.save()
  redirect to( "merchants" )
end

post '/merchants/:id/delete' do
  merchant = Merchant.find( params['id'] )
  merchant.delete
  redirect to "merchants"
end
