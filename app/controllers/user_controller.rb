require './config/environment'

class UserController < ApplicationController
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}/bookmarks"
      # flash message stating successful login
    else
      redirect '/login'
      # flash message stating username / password combo is incorrect
    end
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
      redirect to '/signup'
      #flash message stating user must fill in all signup information
    end
  end

  get '/users/:id/bookmarks' do
    @user = User.find_by_id(params[:id])
    erb :'users/index'
  end

end
