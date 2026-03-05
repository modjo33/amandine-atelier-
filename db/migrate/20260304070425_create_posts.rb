class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.text :caption
      t.string :instagram_url
      t.string :post_type
      t.datetime :published_at
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end
