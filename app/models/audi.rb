class Audi < ApplicationRecord
	belongs_to :movie_hall
	has_many :movies, dependent: :destroy
	has_many :users, dependent: :destroy
	validates :code, presence: true, length: { is: 6 }
	validates :no_of_seats, presence: true
end