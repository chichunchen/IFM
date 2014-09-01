class Book < ActiveRecord::Base
	mount_uploader :picture, PictureUploader

	validates :name, :description, :presence => true
  	validates :price, :numericality => { :greater_than_or_equal_to => 0.0 }
  	validates :legal, :original, inclusion: { in: [true, false] }
  	# validates :picture, presence: true
  	

  	belongs_to :owner, :class_name => "User", :foreign_key => :user_id

  	acts_as_taggable # Alias for acts_as_taggable_on :tags

  	def editable_by?(user)
		user && user == owner
	end

	def self.search(search)
	  	if search
	    	where('name LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end
end
