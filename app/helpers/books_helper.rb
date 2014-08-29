module BooksHelper
	def order_mail book
		user = find_author(book)
		mail_to( user.email,
                 image_tag("email-icon.png", :width => 30),
                 :subject => "資財二手書-#{book.name}",
                 :encode => "javascript" )
	end

	def find_author book
		User.find(book.user_id)	
	end

	def order_fb
		link_to( image_tag("fb-icon.jpg", :width => 32), '#' )
	end

	def same_author? book
		current_user && book.editable_by?(current_user)	
	end
end
