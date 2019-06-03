require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require( 'pry-byebug' )
require_relative( '../models/adoption.rb' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
also_reload( '../models/*' )

# Show all adoptions

get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end

# Show a form to post a new adoption

get '/adoptions/new' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:"adoptions/new")
end

# Post adoption to the database

post '/adoptions' do
  adoption = Adoption.new(params)
  animal = Animal.find(params[:animal_id].to_i)
  animal.adoption_status = "Unavailable"
  animal.update()
  adoption.save()
  erb(:"adoptions/create")
end

# Show only one adoption

get '/adoptions/:id' do
  @adoption = Adoption.find(params[:id])
  erb(:"adoptions/show")
end

# Edit an adoption entry

get '/adoptions/:id/edit' do
  @adoption = Adoption.find(params[:id])
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:"adoptions/edit")
end

# Update entry in database

post '/adoptions/:id' do
  @adoption = Adoption.new(params)
  @adoption.update()
  redirect to '/adoptions'
end

# Delete an adoption from the database

post '/adoptions/:id/delete' do
  delete_adoption = Adoption.find(params[:id])
  delete_adoption.delete()
  redirect to '/adoptions'
end
