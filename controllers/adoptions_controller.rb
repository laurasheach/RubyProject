require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

# Show all adoptions

get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end

# Show only one adoption

# get '/adoptions/:id' do
#   @adopton = Adoption.find(params[:id])
#   erb(:"adoptions/show")
# end
