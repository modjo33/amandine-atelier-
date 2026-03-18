class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.text :excerpt
      t.string :meta_description
      t.string :category
      t.boolean :published, default: false
      t.datetime :published_at
      t.integer :position

      t.timestamps
    end
    add_index :articles, :slug, unique: true
    add_index :articles, :published
    add_index :articles, :published_at
    add_index :articles, :category
  end
end
