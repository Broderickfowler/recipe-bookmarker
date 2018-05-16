class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :recipes
  

  has_secure_password
  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true

  def all_recipes
    recipes + created_recipes
  end

  # instance method "bookmark_recipe" ?
  def add_recipe(recipe)
    #TODO: add recipe via BUILDING a user_recipe relationship
    #WHEN A USER CREATES A RECIPE, a UserRecipe relationship should also be build.
    #BUILD A CUSTOM INSTANCE METHOD for #build or #create ???
    #Depending on what method you use in your CREATE route
    self.user_recipes.build(user_id: self.id, recipe_id: recipe.id)
    self.save
  end

  def remove_recipe(recipe)
    user_recipe = UserRecipe.find_by(user_id: self.id, recipe_id: recipe.id)
    user_recipe.destroy
    self.save
  end


end
