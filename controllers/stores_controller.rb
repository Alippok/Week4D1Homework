require_relative('../models/store.rb')
require_relative('../models/pet.rb')

get '/' do
 erb( :home )
end


get '/stores' do#index
  @stores = Store.all()
  erb ( :"stores/index" )
end


get '/stores/new' do#new
  erb( :"stores/new" ) 
end

post '/stores' do#create
  @store = Store.new( params )
  @store.save()
  redirect to ('/')
end

get '/stores/:id' do#show
  @store = Store.find( params['id'] )
  @pets = @store.pets
  erb(:"stores/show")
end

get '/stores/:id/edit' do#edit
  @store = Store.find( params['id'] )
  erb(:"stores/edit")
end 


post '/stores/:id' do#update
  @store = Store.new( params )
  @store.update()
  redirect to("/stores/#{ params['id'] }")
end

post '/stores/:id/delete' do#destroy
  Store.delete( params['id'] )  
  redirect to '/stores'
end

