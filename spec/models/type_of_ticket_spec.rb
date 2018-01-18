require 'rails_helper'

RSpec.describe TypeOfTicket, type: :model do
	context "creation" do
    it "creates a type_of_ticket with all valid attributes" do
      FactoryGirl.build(:type_of_ticket).should be_valid
    end
  end

  context "to validate the type_of_ticket" do
    it "is valid with a type_of_ticket" do
      FactoryGirl.build(:type_of_ticket, type_of_ticket:'ABC').should be_valid
    end

    it "is invalid without a type_of_ticket" do
      FactoryGirl.build(:type_of_ticket, type_of_ticket: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should have one ticket'do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,type_of_ticket_id: type_of_ticket.id)
      type_of_ticket.ticket.id.should eq ticket.id
    end
  end
end