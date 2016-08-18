json.extract! movie, :id, :title, :description, :year, :rating, :stock, :image, :created_at, :updated_at
json.url movie_url(movie, format: :json)