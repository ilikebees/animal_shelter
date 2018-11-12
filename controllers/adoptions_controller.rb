require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')
also_reload('../models/*')


#INDEX
get '/adoptions' do
  @adoptions = Adoption.all
  erb(:"adoptions/index")
end

#NEW
get '/adoptions/new' do
  @animals = Animal.all
  @owners = Owner.all 

  erb(:"adoptions/new")
end

#SHOW
get '/adoptions/:id' do
  @adoption = Adoption.find(params[:id])
  erb(:"adoptions/show")
end

#CREATE
post '/adoptions' do
  Adoption.new( params ).save
  redirect to '/adoptions'
end

#EDIT
get '/adoptions/:id/edit' do
  @adoptions = Adoption.find(params[:id])
  erb(:"adoptions/edit")
end

#UPDATE
post '/adoptions/:id' do
  adoption = Adoption.new( params )
  adoption.update
  redirect to '/adoptions/' + params[:id]
end

#DELETE
post '/adoptions/:id/delete' do
  @adoption = Adoption.find( params['id'] )
  @adoption.delete
  redirect to "/adoptions"
end

#HOMEPAGE
get '/home' do
  erb(:"/home")
end
