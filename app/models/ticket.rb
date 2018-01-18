class Ticket < ApplicationRecord
	has_one :booking
	belongs_to :show_time
	belongs_to :type_of_ticket
	validates :code, presence: true, length: { is: 6 }
end
