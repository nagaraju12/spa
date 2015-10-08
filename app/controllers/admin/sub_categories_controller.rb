class Admin::SubCategoriesController < ApplicationController

def new
		@sub_category = SubCategory.new
	end

	def create
		@sub_category = SubCategory.new(sub_category_params.merge(:category_id => params[:category_id]))
		if @sub_category.save
			redirect_to admin_category_sub_categories_path, notice:  "Sub Category is Created"
		else
			render action 'new'
		end
	end

	def index
		@sub_categories = SubCategory.includes(:category).where("category_id=?", params[:category_id]).paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
	end
	
	def show
	end

	def edit
		@products = Product.find(params[:id])
	end 

	def update
		if @sub_category.update_attributes(sub_category_params)
			
			redirect_to admin_category_sub_categories_path, notice:  "Sub Category is Updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@sub_category = SubCategory.find(params[:id])
		if @sub_category.destroy
			redirect_to admin_category_sub_categories_path, notice: "Category deleted successfully."
		end
	end

	private

	def set_subcategory
		@sub_category = SubCategory.find(params[:id])
	end

	def sub_category_params
		params.require(:sub_category).permit(:category_id, :name)
	end

end
