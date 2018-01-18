require 'rails_helper'

RSpec.describe User, type: :model do
	context "creation" do
    it "creates a user with all valid attributes" do
      FactoryGirl.build(:user).should be_valid
    end
  end

  context "vaidations" do
    it "is valid with a name" do
      FactoryGirl.build(:user, name:'ABC').should be_valid
    end

    it "is valid with a address" do
      FactoryGirl.build(:user, address: '10 ABC').should be_valid
    end

    it "is valid with a phone_no" do
      FactoryGirl.build(:user, phone_no: '999999999').should be_valid
    end

    it "is valid without a city" do
      FactoryGirl.build(:user, city: nil).should be_valid
    end

    it "is invalid without a name" do
      FactoryGirl.build(:user, name: nil).should_not be_valid
    end

    it "is invalid without a address" do
      FactoryGirl.build(:user, address: nil).should_not be_valid
    end

    it "is invalid without a phone_no" do
      FactoryGirl.build(:user, phone_no: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should belongs to movie_hall'do
      movie_hall = FactoryGirl.create(:movie_hall)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id)
      user.movie_hall.id.should eq movie_hall.id
    end

    it 'should belongs to audi'do
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,audi_id: audi.id)
      user.audi.id.should eq audi.id
    end

    it 'should have many bookings'do
      user = FactoryGirl.create(:user)
      booking = FactoryGirl.create(:booking ,user_id: user.id)
      user.bookings.includes(booking)
    end
  end
end