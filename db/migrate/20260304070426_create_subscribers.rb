class CreateSubscribers < ActiveRecord::Migration[8.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :first_name
      t.boolean :confirmed
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
