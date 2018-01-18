require 'rails_helper'

RSpec.describe Audi, type: :model do
  context "creation" do
    it "creates an audi with all valid attributes" do
      FactoryGirl.build(:audi).should be_valid
    end
  end

  context "validations" do
    it "is valid with a code" do
      FactoryGirl.build(:audi, code:'ABC123').should be_valid
    end

    it "is valid with a no_of_seats" do
      FactoryGirl.build(:audi, no_of_seats: '10').should be_valid
    end

    it "is invalid with a code" do
      FactoryGirl.build(:audi, code: 'ABC51').should_not be_valid
    end

    it "is invalid with a code" do
      FactoryGirl.build(:audi, code: 'ABC5661').should_not be_valid
    end

    it "is invalid without a code" do
      FactoryGirl.build(:audi, code: nil).should_not be_valid
    end

    it "is invalid without no_of_seats" do
      FactoryGirl.build(:audi, no_of_seats: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should belongs to movie_hall'do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      audi.movie_hall.id.should eq movie_hall.id
    end

    it 'should have many movies'do
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,audi_id: audi.id)
      audi.movies.includes(audi)
    end

    it 'should have many users'do
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,audi_id: audi.id)
      audi.users.includes(audi)
    end
  end
end