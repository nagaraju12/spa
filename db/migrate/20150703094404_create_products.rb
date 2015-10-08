class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
			t.string :name
			t.string :pimage
			t.string :pvideo
			t.string :pdoc
			t.text :description
			t.float :price
			t.float :discount
			t.boolean :is_featured, :default => false
      t.timestamps null: false
    end
  end
end
