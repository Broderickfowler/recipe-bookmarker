require './config/environment'
require 'rack-flash'

class UserController < ApplicationController
  get '/login' do
    if is_logged_in?
      #flash message -- you are already logged in
      @user = current_user
      redirect "/recipes"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if !!@user && @user.authenticate(params[:user][:password])
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect "/recipes"
      # flash message stating successful login
    else
      redirect '/login'
      # flash message stating username / password combo is incorrect
      # if password doesn't work, redirect to login
      # if username is not found, redirect to signup
    end
  end

  get '/signup' do
    if is_logged_in?
      #flash message -- you are already logged in
      @user = current_user
      redirect "/recipes"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])

    if !!@user.id
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect "/recipes"
      # flash message stating "Successfully created user"
    else
      redirect to '/signup'
      # flash message stating user must fill in all signup information
    end
  end

  get '/users/:id/bookmarks' do
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    erb :'users/index'
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
