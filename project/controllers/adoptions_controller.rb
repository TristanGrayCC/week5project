require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/adoption.rb')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')
require ('pry-byebug')

get '/adoptions' do
  @adoptions = Adoption.all
  erb (:"adoptions/index")
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animal.all
  erb (:"adoptions/new")
end

post '/adoptions' do
  @adoption = Adoption.new(params)
  @adoption.save
  @adoptions = Adoption.all
  erb (:"adoptions/index")
end

post '/adoptions/:id/delete' do
  Adoption.delete(params[:id])
  redirect to("/adoptions")
end