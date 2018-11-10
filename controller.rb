require('sinatra')
require('sinatra/contrib/all')
require_relative('models/animal')
require_relative('models/owner')
also_reload('./models/*')

get '/animals' do
  @animals = Animal.all
  erb(:index)
end



get '/home' do
  erb(:home)
end
