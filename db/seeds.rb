
create_account = User.create([email: 'example@gmail.com', 
							  password: '12345678', 
							  password_confirmation: '12345678', 
							  name: '測試用帳號'])

tag_list = ["資訊", "財金", "外語", "通識", "其他"]
create_tag = for i in 1..tag_list.length do
                ActsAsTaggableOn::Tag.create(:name => tag_list[i])
             end

create_books = for i in 1..20 do
					Book.create!([
								name: "種子建立的第#{i}本書", 
								description: "第#{i}個種子",		
								price: "#{100*rand(15) + 100}",
							 	legal: true,
							 	original: true, 
							 	user_id: "1", 
							 	tag_list: "#{tag_list[rand(tag_list.length)]}"
							 	#, picture:
							])
				end