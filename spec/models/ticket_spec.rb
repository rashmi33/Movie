require 'rails_helper'

RSpec.describe Ticket, type: :model do
	context "to create ticket" do
    it "creates a ticket with all valid attributes" do
      FactoryGirl.build(:ticket).should be_valid
    end
  end

  context "validations" do
    it "is valid with a code" do
      FactoryGirl.build(:ticket, code:'AB122C').should be_valid
    end
   
    it "is invalid with a code" do
      FactoryGirl.build(:ticket, code: 'ABC51').should_not be_valid
    end

    it "is invalid with a code" do
      FactoryGirl.build(:ticket, code: 'ABC5661').should_not be_valid
    end

    it "is valid without a seat_no" do
      FactoryGirl.build(:ticket, seat_no: nil).should be_valid
    end

    it "is invalid without a code" do
      FactoryGirl.build(:ticket, code: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should have one booking'do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      ticket.booking.id.should eq booking.id
    end

    it 'should belongs to show_time'do
      show_time = FactoryGirl.create(:show_time)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id)
      ticket.show_time.id.should eq show_time.id
    end

    it 'should belongs to type_of_ticket'do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,type_of_ticket_id: type_of_ticket.id)
      ticket.type_of_ticket.id.should eq type_of_ticket.id
    end
  end
end