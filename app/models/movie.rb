class Movie < ApplicationRecord
	belongs_to :movie_hall
	belongs_to :audi
	has_many :bookings, dependent: :destroy
	validates :name, presence: true
	validates :movie_type, presence: true, inclusion: { in: ['U', 'A', 'U/A'] }
	validates :rating, presence: true
end
