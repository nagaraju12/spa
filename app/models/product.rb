class Product < ActiveRecord::Base
		 mount_uploader :pimage, PimageUploader # Tells rails to use this uploader for this model.
		 mount_uploader :pvideo, PvideoUploader
		 mount_uploader :pdoc, PdocUploader

		 #belongs_to :category
		 #belongs_to :sub_category
		  belongs_to :sub_sub_category
		end
