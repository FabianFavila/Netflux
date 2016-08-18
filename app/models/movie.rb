class Movie < ActiveRecord::Base
	has_many :rents
end
