class Book < ActiveRecord::Base
	mount_uploader :picture, PictureUploader

	validates :name, :description, :presence => true
  	validates :price, :numericality => { :greater_than_or_equal_to => 0.0 }

  	belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  	def editable_by?(user)
		user && user == owner
	end
end
