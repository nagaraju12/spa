class AddSubSubCategoryIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :sub_sub_category_id, :integer
  end
end
