
create_account = User.create([email: 'example@gmail.com', 
							  password: '12345678', 
							  password_confirmation: '12345678', 
							  name: '測試用帳號'])

tag_list = ["資訊", "財金", "外語", "通識", "其他"]
create_tag = for i in 1..tag_list.length do
                  ActsAsTaggableOn::Tag.create(:name => tag_list[i])
             end

create_books = for i in 1..20 do
                  Book.create!([name: "教科書 no.#{i}", 
                  				description: "這是用種子建立的第 #{i} 本教科書", 
                  				picture: "fb-icon.jpg", 
                  				user_id: "1", 
                  				price: i * 100, 
                  				tag_list: tag_list[i % tag_list.length]
                          # legal: 
                          # original: 
                          ])
                end

