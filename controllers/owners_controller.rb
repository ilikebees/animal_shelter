require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/owner')
also_reload('../models/*')

#INDEX
get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

#NEW
get '/owners/new' do

  erb(:"owners/new")
end

#SHOW
get '/owners/:id' do
  @owner = Owner.find(params[:id])
  erb(:"owners/show")
end

#CREATE
post '/owners' do
  Owner.new( params ).save
  redirect to '/owners'
end

#EDIT
get '/owners/:id/edit' do
  @owners = Owner.find(params[:id])
  erb(:"owners/edit")
end

#UPDATE
post '/owners/:id' do
  owner = Owner.new( params )
  owner.update
  redirect to 'owners/' + params[:id]
end

#DELETE
post '/owners/:id/delete' do
  @owner = Owner.find( params['id'] )
  @owner.delete
  redirect to "owners"
end

#HOMEPAGE
get '/home' do
  erb(:"/home")
end
