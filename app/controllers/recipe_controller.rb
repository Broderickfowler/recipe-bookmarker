require './config/environment'

class RecipeController < ApplicationController
  #GET - INDEX
  get '/recipes' do
    @user = current_user
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  #GET - NEW
  get '/recipes/new' do
    @creator = current_user
    erb :'recipes/new'
  end

  #GET - SHOW
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @creator = User.find_by_id(@recipe.creator_id)
    @user = current_user
    erb :'recipes/show'
  end

  #GET - EDIT
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'recipes/edit'
  end

  #POST - CREATE
  post '/recipes' do
    #TODO: Add validations to Recipe model to ensure good data.
    #QUESTION: What is considered good data for that model?
    @recipe = Recipe.create(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(params[:recipe])
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect '/recipes'
  end

  # ROUTES BELOW CONTROLLER USER ADDING AND REMOVING BOOKMARK
  # THIS MAY NOT ADHERE TO RESTFUL ROUTES - HOW WOULD I FIX IT TO BE RESTFUL?

  patch '/recipes/:id/add' do
    #add_recipe method
    #TODO: change helper methods to be in controller. use current_user method to
    #refer to current user here and then us add_recipe method.
    @recipe = Recipe.find_by_id(params[:id])
    current_user.add_recipe(@recipe)
    redirect "/users/#{current_user.id}/bookmarks"
  end

  patch '/recipes/:id/remove' do
    @recipe = Recipe.find_by_id(params[:id])
    current_user.remove_recipe(@recipe)
    redirect "/users/#{current_user.id}/bookmarks"
  end

end
