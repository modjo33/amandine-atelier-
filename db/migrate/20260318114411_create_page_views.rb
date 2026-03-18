class CreatePageViews < ActiveRecord::Migration[8.1]
  def change
    create_table :page_views do |t|
      t.string :path
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
    add_index :page_views, :created_at
    add_index :page_views, :path
  end
end
