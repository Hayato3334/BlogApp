class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :post_id

      t.timestamps

      t.index :user_id
      t.index :post_id
      t.index [:user_id, :post_id]
    end
  end
end
