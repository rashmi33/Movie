require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  context "GET #index" do
    it "should display all the bookings" do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show booking with given id" do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      get :show, id: booking.id, format: :json
      response.should have_http_status(:ok)
    end
  end
 
  context "GET #edit" do
    it "should edit booking with given id" do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      get :edit, id: booking.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid booking with all attributes" do 
      ticket = FactoryGirl.create(:ticket)
      post :create,  booking: { date_of_movie: Faker::Date.forward(30), no_of_persons: Faker::Number.number(2), amount: Faker::Number.decimal(5, 2), seats_alloted: Faker::Number.number(2), ticket_id: ticket.id}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the booking with valid attributes" do
      ticket = FactoryGirl.create(:ticket)
			booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      put :update, id:booking.id, booking: { date_of_movie: booking.date_of_movie, no_of_persons: booking.no_of_persons, amount: booking.amount, seats_alloted: booking.seats_alloted}, format: :json
      expect(response).to redirect_to booking_path(booking.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the booking" do
      ticket = FactoryGirl.create(:ticket)
			booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      delete :destroy,  id: booking.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid booking" do
      ticket = FactoryGirl.create(:ticket)
			booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      get :show, id:500, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      get :show, id: 'ABC' , format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid booking" do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      get :edit, id:500, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a booking with invalid attributes' do
      ticket = FactoryGirl.create(:ticket)
      post :create, booking: {date_of_movie: Faker::Date.forward(30)},format: :json
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not create a booking with nil values' do
      booking= FactoryGirl.create(:booking)
      post :create, booking: {date_of_movie: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update booking with invalid id' do
      ticket = FactoryGirl.create(:ticket)
			booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      put :update, id:511,booking: {date_of_movie: "12/12/2018"}, format: :json
      response.should have_http_status(:not_found)
    end
    it "should not update the booking with invalid attributes" do
      ticket = FactoryGirl.create(:ticket)
      booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      put :update, id:booking.id, booking: { date_of_movie: nil, no_of_persons: booking.no_of_persons, amount: booking.amount, seats_alloted: booking.seats_alloted}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end 

  context 'DELETE #destroy' do
    it 'should not delete a booking with invalid id' do
      ticket = FactoryGirl.create(:ticket)
			booking = FactoryGirl.create(:booking ,ticket_id: ticket.id)
      delete :destroy, id:555,format: :json
      response.should have_http_status(:not_found)
    end
  end
end