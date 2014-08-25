json.array!(@books) do |book|
  json.extract! book, :id, :name, :description, :picture, :price, :course
  json.url book_url(book, format: :json)
end
