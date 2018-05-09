class AddCreatorToRecipes < ActiveRecord::Migration
  def change
      #add_column(table_name, column_name, type, options = {}) public
      add_column :recipes, :creator, :integer
  end
end
