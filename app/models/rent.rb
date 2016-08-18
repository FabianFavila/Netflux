class Rent < ActiveRecord::Base
	belongs_to :user
	has_one :movie
end
