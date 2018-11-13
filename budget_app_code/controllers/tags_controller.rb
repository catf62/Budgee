require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )
also_reload( '../models/*' )

get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

get '/tags/new' do
  erb ( :"tags/new" )
end

post '/tags' do # create
  tag = Tag.new( params )
  tag.save()
  redirect to( "tags" )
end

get '/tags/:id' do # show
  @tag = Tag.find( params[:id] )
  erb(:"tags/show")
end
