module BooksHelper
	def order_mail book
		user = find_seller(book)
		mail_to( user.email,
                 image_tag("email-icon.png", :width => 30),
                 :subject => "資財二手書-#{book.name}",
                 :encode => "javascript" )
	end

	def find_seller book
		User.find(book.user_id)	
	end

	def same_seller? book
		current_user && book.editable_by?(current_user)	
	end
end
