class CreateSubSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_sub_categories do |t|
       t.string :name
       t.string :sub_category_id
      t.timestamps null: false
    end
  end
end
