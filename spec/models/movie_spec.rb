require 'rails_helper'

RSpec.describe Movie, type: :model do
	context "creation" do
    it "creates a movie with all valid attributes" do
      FactoryGirl.build(:movie).should be_valid
    end
  end

  context "validations" do
    it "is valid with a name" do
      FactoryGirl.build(:movie, name:'ABC').should be_valid
    end

    it "is valid with a movie_type" do
      FactoryGirl.build(:movie, movie_type: 'U').should be_valid
    end

     it "is valid with a movie_type" do
      FactoryGirl.build(:movie, movie_type: 'A').should be_valid
    end

     it "is valid with a movie_type" do
      FactoryGirl.build(:movie, movie_type: 'U/A').should be_valid
    end

    it "is valid with a rating" do
      FactoryGirl.build(:movie, rating: '3').should be_valid
    end

    it "is valid without a duration" do
      FactoryGirl.build(:movie, duration: nil).should be_valid
    end

     it "is valid without a genre" do
      FactoryGirl.build(:movie, genre: nil).should be_valid
    end

    it "is valid without a is_bollywood" do
      FactoryGirl.build(:movie, is_bollywood: nil).should be_valid
    end

     it "is invalid without a name" do
      FactoryGirl.build(:movie, name: nil).should_not be_valid
    end

    it "is invalid without a movie_type" do
      FactoryGirl.build(:movie, movie_type: nil).should_not be_valid
    end

     it "is invalid without a rating" do
      FactoryGirl.build(:movie, rating: nil).should_not be_valid
    end
  end
  
  context "associations" do
    it 'should belongs to movie_hall'do
      movie_hall = FactoryGirl.create(:movie_hall)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id)
      movie.movie_hall.id.should eq movie_hall.id
    end

    it 'should belongs to audi'do
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,audi_id: audi.id)
      movie.audi.id.should eq audi.id
    end

    it 'should have many bookings'do
      movie = FactoryGirl.create(:movie)
      booking = FactoryGirl.create(:booking ,movie_id: movie.id)
      movie.bookings.includes(movie)
    end
  end
end