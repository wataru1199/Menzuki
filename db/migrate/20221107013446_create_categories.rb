class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :category_name,      null: false
      t.integer :order_number,      null: false, default: 0
      t.timestamps
    end
  end
end
