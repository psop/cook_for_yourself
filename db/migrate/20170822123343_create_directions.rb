class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.text :step

      t.timestamps null: false
    end
  end
end
