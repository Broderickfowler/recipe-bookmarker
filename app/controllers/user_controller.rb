require './config/environment'

class UserController < ApplicationController
  get '/login' do
    if Helpers.is_logged_in?(session)
      #flash message -- you are already logged in
      @user = Helpers.current_user(session)
      redirect "/users/#{@user.id}/bookmarks"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if !!@user && @user.authenticate(params[:user][:password])
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}/bookmarks"
      # flash message stating successful login
    else
      redirect '/login'
      # flash message stating username / password combo is incorrect
      # if password doesn't work, redirect to login
      # if username is not found, redirect to signup
    end
  end

  get '/signup' do
    if Helpers.is_logged_in?(session)
      #flash message -- you are already logged in
      @user = Helpers.current_user(session)
      redirect "/users/#{@user.id}/bookmarks"
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    @user = User.create(params[:user])

    if !!@user.id
      session[:name] = @user.username
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}/bookmarks"
      # flash message stating "Successfully created user"
    else
      redirect to '/signup'
      # flash message stating user must fill in all signup information
    end
  end

  get '/users/:id/bookmarks' do
    @user = User.find_by_id(params[:id])
    erb :'users/index'
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
