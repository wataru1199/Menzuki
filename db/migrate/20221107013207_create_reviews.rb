class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id, null: false
      t.integer :category_id, null: false
      t.string :shop_name, null: false
      t.string :place, null: false
      t.text :review_cont

      t.timestamps
    end
  end
end
