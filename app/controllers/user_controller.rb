require './config/environment'

class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    #set session[:name]
    #set session[:user_id]
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    @user = User.create(params[:user])

    #TODO: Add validation to the model class to ensure NO USERNAME DUPLICATES
    #TODO: Helper methods "logged in?" and "current_user"

    if !!@user.id
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}/bookmarks"
      # flash message stating "Successfully created user"
    else
      #flash message stating user must fill in all signup information
      redirect to '/signup'
    end
  end

  get '/users/:id/bookmarks' do
    @user = User.find_by_id(params[:id])
    erb :'users/index'
  end

end
