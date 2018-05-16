class User < ActiveRecord::Base
  has_many :user_recipes
  has_many :created_recipes, class_name: "Recipe", foreign_key: :creator_id
  has_many :recipes, through: :user_recipes

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
    self.build.user_recipe(user_id: self.id, recipe_id: recipe.id)
    self.save
  end
  

end
