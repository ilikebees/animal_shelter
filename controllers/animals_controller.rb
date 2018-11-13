require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/owner')
also_reload('../models/*')

#INDEX
get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

#NEW
get '/animals/new' do

  erb(:"animals/new")
end

#SHOW
get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

#CREATE
post '/animals' do
  Animal.new( params ).save
  redirect to '/animals'
end

#EDIT
get '/animals/:id/edit' do
  @animals = Animal.find(params[:id])
  erb(:"animals/edit")
end

#UPDATE
post '/animals/:id' do
  animal = Animal.new( params )
  animal.update
  redirect to '/animals/' + params[:id]
end

#DELETE
post '/animals/:id/delete' do
  @animal = Animal.find( params['id'] )
  @animal.delete
  redirect to "/animals"
end

#HOMEPAGE
get '/home' do
  erb :home
end
