require 'rails_helper'

RSpec.describe ShowTime, type: :model do
	context "creation" do
    it "creates a show_time with all valid attributes" do
      FactoryGirl.build(:show_time).should be_valid
    end
  end

  context "validations" do
    it "is valid with a time" do
      FactoryGirl.build(:show_time, time: '10AM').should be_valid
    end

    it "is invalid without a time" do
      FactoryGirl.build(:show_time, time: nil).should_not be_valid
    end
  end

  context "associations" do
    it 'should have many tickets'do
      show_time = FactoryGirl.create(:show_time)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id)
      show_time.tickets.includes(show_time)
    end
  end
end
