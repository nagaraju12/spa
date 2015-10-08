class SubSubCategory < ActiveRecord::Base
#has_many :sub_categories, :dependent => :destroy
has_many :products, :dependent => :destroy
belongs_to :category, :dependent => :destroy
belongs_to :sub_category, :dependent => :destroy
end