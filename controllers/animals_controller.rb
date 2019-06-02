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
