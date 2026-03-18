class CreateTestimonials < ActiveRecord::Migration[8.1]
  def change
    create_table :testimonials do |t|
      t.text :quote
      t.string :name
      t.string :role
      t.integer :position
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
