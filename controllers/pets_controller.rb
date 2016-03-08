require_relative('../models/pet.rb')
require_relative('../models/store.rb')

post '/pets' do#create
  @pet = Pet.new( params )
  @pet.save()
  redirect to("/stores/#{params['store_id']}")
end

get '/pets/:id' do
  @pet = Pet.find( params['id'] )
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @pet = Pets.find( params['id'] )
  erb(:"pets/edit")
end

post '/pets/:id/delete' do
  Pet.delete( params['id'] )
  redirect to '/stores'
end