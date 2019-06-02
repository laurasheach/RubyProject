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

# Show only one animal

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end
