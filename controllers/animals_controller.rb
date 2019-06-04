require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

# Show all animals

get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end

# Show a only the available animals

get '/available-animals' do
  @animals = Animal.all()
  erb (:"animals/available")
end

# Show the animals which are still in training/vet care

get '/unavailable-unadopted' do
  @animals = Animal.all()
  erb (:"animals/unavailable-unadopted")
end

# Show a form to admit a new animal

get '/animals/new' do
  erb(:"animals/new")
end

# Admit animal to the database

post '/animals' do
  @animal = Animal.new(params)
  @animal.save()
  erb(:"animals/create")
end

# Show only one animal

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

# Edit an animal entry

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

# Update entry in database

post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update()
  redirect to '/animals'
end

# Delete an animal from the database

post '/animals/:id/delete' do
  delete_animal = Animal.find(params[:id])
  delete_animal.delete()
  redirect to '/animals'
end
