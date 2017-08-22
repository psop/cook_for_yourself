class AddProductIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :product_id, :integer
  end
end
