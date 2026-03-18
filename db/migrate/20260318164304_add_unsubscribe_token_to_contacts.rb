class AddUnsubscribeTokenToContacts < ActiveRecord::Migration[8.1]
  def change
    add_column :contacts, :unsubscribe_token, :string
    add_index :contacts, :unsubscribe_token, unique: true
  end
end
