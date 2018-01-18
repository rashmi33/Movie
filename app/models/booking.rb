class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :ticket
	belongs_to :movie
	validates :date_of_movie, presence: true
	validates :no_of_persons, presence: true
	validates :amount, presence: true
	validates :seats_alloted, presence: true
end