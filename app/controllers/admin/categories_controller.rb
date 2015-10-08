class Admin::CategoriesController < ApplicationController

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to admin_categories_path, notice:  "Category is Created"
		else
			render action 'new'
		end
	end

	def index
		@categories = Category.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
	end
	
	def show
	end

	def edit
	end 

	def update
		if @category.update_attributes(category_params)
			
			redirect_to admin_categories_path, notice:  "Category is Updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		if @category.destroy			     
			redirect_to admin_categories_path, notice: "Category deleted successfully."
		end
	end

	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit!
	end
end