json.array!(@books) do |book|
  json.extract! book, :id, :name, :price, :description, :course
  json.url book_url(book, format: :json)
end
