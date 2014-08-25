class Book < ActiveRecord::Base
	mount_uploader :picture, PictureUploader

	validates :name, :description, :presence => true
  	validates :price, :numericality => { :greater_than_or_equal_to => 0.0 }
  	validates :name, :uniqueness => true
end
