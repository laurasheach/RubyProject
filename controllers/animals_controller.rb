require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

get '/animals' do
  @animals = Animal.all()
  erb (:"animals/index")
end
