class SubCategory < ActiveRecord::Base
	belongs_to :category, :dependent => :destroy
	#has_many :products, :dependent => :destroy
	has_many :sub_sub_categories, :dependent => :destroy
end
