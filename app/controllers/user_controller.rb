require './config/environment'

class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    binding.pry
  end
end
