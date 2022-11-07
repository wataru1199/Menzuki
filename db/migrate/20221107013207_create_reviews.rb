class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id
      t.integer :review_id
      t.string :shop_name
      t.string :place
      t.text :review_cont

      t.timestamps
    end
  end
end
