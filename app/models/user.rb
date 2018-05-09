class User < ActiveRecord::Base
  has_many :user_recipes
  has_many :created_recipes, class_name: "Recipe", foreign_key: :creator_id
  has_many :recipes, through: :user_recipes

  has_secure_password
  validates_presence_of :username, :password_digest
  validates :username, uniqueness: true

end
