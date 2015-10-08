class Admin::SubSubCategoriesController < ApplicationController

	def new
		@sub_sub_category = SubSubCategory.new
	end

	def create
		@sub_sub_category = SubSubCategory.new(sub_sub_category_params.merge(sub_category_id: params[:sub_category_id]))
		if @sub_sub_category.save
			redirect_to admin_category_sub_category_sub_sub_categories_path, notice: "Sub Sub Category created"
		else 
			render action 'new'
		end
	end

	def index
		@sub_sub_categories = SubSubCategory.includes(:sub_category).where("sub_category_id=?", params[:sub_category_id]).paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
end

	private

	def set_sub_subcategory
		@sub_sub_category = SubSubCategory.find(params[:id])
	end

	def sub_sub_category_params
		params.require(:sub_sub_category).permit(:sub_category_id, :name)
	end		

end
