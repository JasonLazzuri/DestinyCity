class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.string :category

      t.timestamps
    end
  end
end
