require './config/environment'

class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.create(params[:user])

    #TODO: Add validation to the model class to ensure NO USERNAME DUPLICATES

    if !!@user.id
      session[:name] = @user.username
      session[:id] = @user.id
      # redirect to user's index page
      # flash message stating "Successfully created user"
    else
      #flash message stating user must fill in all signup information
      redirect to '/signup'
    end

  end
end
