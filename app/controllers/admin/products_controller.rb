class Admin::ProductsController < ApplicationController
# before_filter :is_admin?
def index
  @products = Product.all
end

def new
  @product = Product.new
end

def create
  @product = Product.new(product_params.merge(:category_id => params[:category_id], :sub_category_id => params[:sub_category_id], :sub_sub_category_id => params[:sub_sub_category_id]))

  if @product.save
    redirect_to admin_products_path, notice: "The product #{@product.name} has been uploaded."
  else
    render "new"
  end
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to admin_products_path, notice:  "The product #{@product.name} has been deleted."
end

def load_subcat

  @category = Category.find(params[:category_id])
  @sub_categories = @category.sub_categories
  respond_to do |format|
    format.js
  end
end

def load_subsubcat

  @subcategory = SubCategory.find(params[:subcategory_id])
  @sub_sub_categories = @subcategory.sub_sub_categories
  respond_to do |format|
    format.js
  end
end

private

def set_product
  @product = Product.find(params[:id])
end
def product_params
  params.require(:product).permit(:name, :pimage, :pvideo, :price, :description, :discount, :is_featured, :pdoc, :category_id, :sub_category_id, :sub_sub_category_id)
end
end
