class AddSourceToSubscribers < ActiveRecord::Migration[8.1]
  def change
    add_column :subscribers, :source, :string
  end
end
