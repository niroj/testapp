class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :destination
      t.references :user

      t.timestamps
    end
    add_index :reviews, :destination_id
    add_index :reviews, :user_id
  end
end
