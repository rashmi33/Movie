class User < ApplicationRecord
	belongs_to :movie_hall
	has_many :bookings, dependent: :destroy
	belongs_to :audi
	validates :name, presence: true
	validates :address, presence: true
	validates :phone_no, presence: true, length: {maximum: 17, minimum: 5}
end