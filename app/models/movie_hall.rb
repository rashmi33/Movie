class MovieHall < ApplicationRecord
	has_many :users, dependent: :destroy
	has_many :audis, dependent: :destroy
	has_many :movies, dependent: :destroy
	validates :name, presence: true
	validates :address, presence: true
	validates :city, presence: true
end