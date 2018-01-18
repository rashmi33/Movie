require 'rails_helper'

RSpec.describe Booking, type: :model do
	context "creation" do
    it "creates a booking with all valid attributes" do
      FactoryGirl.build(:booking).should be_valid
    end
  end

  context "validations" do
    it "is valid with a date_of_movie" do
      FactoryGirl.build(:booking, date_of_movie:'12/01/2018').should be_valid
    end

    it "is valid with a no_of_persons" do
      FactoryGirl.build(:booking, no_of_persons: '4').should be_valid
    end

    it "is valid with a amount" do
      FactoryGirl.build(:booking, amount: '200').should be_valid
    end

    it "is valid with a no_of_persons" do
      FactoryGirl.build(:booking, no_of_persons: '4').should be_valid
    end

    it "is valid with a seats_alloted" do
      FactoryGirl.build(:booking, seats_alloted: '2').should be_valid
    end

    it "is invalid without a date_of_movie" do
      FactoryGirl.build(:booking, date_of_movie: nil).should_not be_valid
    end

    it "is invalid without a no_of_persons" do
      FactoryGirl.build(:booking, no_of_persons: nil).should_not be_valid
    end

    it "is invalid without a amount" do
      FactoryGirl.build(:booking, amount: nil).should_not be_valid
    end

    it "is invalid without a seats_alloted" do
      FactoryGirl.build(:booking, seats_alloted: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should belongs to user'do
      user = FactoryGirl.create(:user)
      booking = FactoryGirl.create(:booking ,user_id: user.id)
      booking.user.id.should eq user.id
    end

    it 'should belongs to ticket'do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      booking.ticket.id.should eq ticket.id
    end

    it 'should belongs to movie'do
      movie = FactoryGirl.create(:movie)
      booking = FactoryGirl.create(:booking ,movie_id: movie.id)
      booking.movie.id.should eq movie.id
    end
  end
end