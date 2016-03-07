require_relative('../models/store.rb')

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
  redirect to erb( :home )
end