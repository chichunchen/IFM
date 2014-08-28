module BooksHelper
	def order_mail book
		user = User.find(book.user_id)
		mail_to( user.email,
                 "寄信給 #{user.name}",
                 :subject => "資財二手書-#{book.name}",
                 :encode => "javascript" )
	end

	def same_author? book
		current_user && book.editable_by?(current_user)	
	end
end
