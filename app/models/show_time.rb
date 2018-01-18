class ShowTime < ApplicationRecord
	has_many :tickets, dependent: :destroy
	validates :time, presence: true
end
