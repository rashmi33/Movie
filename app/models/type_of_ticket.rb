class TypeOfTicket < ApplicationRecord
	has_one :ticket
	validates :type_of_ticket, presence: true
end
