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
    #Is this a "safe" method?  Perhaps I can add more safety nets to ensure user
    #cannot add recipes outside of this method
    self.recipes << recipe
    self.save
  end

end
