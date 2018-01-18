require 'rails_helper'

RSpec.describe MovieHall, type: :model do
  context "creation" do
    it "creates a movie hall with all valid attributes" do
      FactoryGirl.build(:movie_hall).should be_valid
    end
  end

  context "validations" do
    it "is valid with a name" do
      FactoryGirl.build(:movie_hall, name:'ABC').should be_valid
    end

    it "is valid with a address" do
      FactoryGirl.build(:movie_hall, address: 'ABC').should be_valid
    end

    it "is valid with a city" do
      FactoryGirl.build(:movie_hall, city: 'ABC').should be_valid
    end

    it "is invalid without a name" do
      FactoryGirl.build(:movie_hall, name: nil).should_not be_valid
    end

    it "is invalid without a address" do
      FactoryGirl.build(:movie_hall, address: nil).should_not be_valid
    end

    it "is invalid without a city" do
      FactoryGirl.build(:movie_hall, city: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should have many users'do
      movie_hall = FactoryGirl.create(:movie_hall)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id)
      movie_hall.users.includes(user)
    end

    it 'should have many audis'do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      movie_hall.audis.includes(audi)
    end

    it 'should have many movies'do
      movie_hall = FactoryGirl.create(:movie_hall)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id)
      movie_hall.movies.includes(movie)
    end
  end
end