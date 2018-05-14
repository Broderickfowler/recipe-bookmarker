require './config/environment'

class RecipeController < ApplicationController
  #GET - INDEX
  get '/recipes' do
    @user = Helpers.current_user(session)
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  #GET - NEW
  get '/recipes/new' do
    @creator = Helpers.current_user(session)
    erb :'recipes/new'
  end

  #GET - SHOW
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @creator = User.find_by_id(@recipe.creator_id)
    @user = Helpers.current_user(session)
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


end
