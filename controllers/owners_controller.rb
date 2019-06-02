require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/owner.rb' )
require_relative( '../models/animal.rb' )
require_relative( '../models/adoption.rb' )
also_reload( '../models/*' )

# Show all owners

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

# Show a form to admit a new animal

get '/owners/new' do
  erb(:"owners/new")
end

# Admit animal to the database

post '/owners' do
  @owner = Owner.new(params)
  @owner.save()
  erb(:"owners/create")
end

#Show only one owner

get '/owners/:id' do
  @owner = Owner.find(params['id'].to_i)
  @adoption = Adoption.all
  erb(:"owners/show")
end

# Edit an owner entry

get '/owners/:id/edit' do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

# Update entry in database

post '/owners/:id' do
  @owner = Owner.new(params)
  @owner.update()
  redirect to '/owners'
end

# Delete an owner from the database

post '/owners/:id/delete' do
  delete_owner = Owner.find(params[:id])
  delete_owner.delete()
  redirect to '/owners'
end
