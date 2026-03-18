class CreateSiteContents < ActiveRecord::Migration[8.1]
  def change
    create_table :site_contents do |t|
      t.string :key
      t.text :value
      t.string :content_type
      t.string :section
      t.integer :position

      t.timestamps
    end
    add_index :site_contents, :key, unique: true
  end
end
