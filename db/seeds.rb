
create_account = User.create([email: 'example@gmail.com', 
							  password: '12345678', 
							  password_confirmation: '12345678', 
							  name: '測試用帳號'])

create_groups = for i in 1..20 do
                  Book.create!([name: "教科書 no.#{i}", 
                  				description: "這是用種子建立的第 #{i} 本教科書", 
                  				picture: "email-icon.png", 
                  				user_id: "1", 
                  				price: i * 100, 
                  				tag_list: "test, other"])
                end
