require 'rails_helper'

RSpec.describe TypeOfTicketsController, type: :controller do
  context "GET #index" do
    it "should display all the type_of_tickets" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show type_of_ticket with given id" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      get :show, id: type_of_ticket.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit type_of_ticket with given id" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      get :edit, id: type_of_ticket.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid type_of_ticket with all attributes" do 
      post :create,  type_of_ticket: { type_of_ticket: Faker::Name.name}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the type_of_ticket with valid attributes" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      put :update, id:type_of_ticket.id, type_of_ticket: { type_of_ticket: type_of_ticket.type_of_ticket}, format: :json
      expect(response).to redirect_to type_of_ticket_path(type_of_ticket.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the type_of_ticket" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      delete :destroy,  id: type_of_ticket.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid type_of_ticket" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      get :show, id:500, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      get :show, id: 'ABC' , format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid type_of_ticket" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      get :edit, id:500, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a type_of_ticket with nil values' do
      type_of_ticket= FactoryGirl.create(:type_of_ticket)
      post :create, type_of_ticket: {type_of_ticket: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update type_of_ticket with invalid id' do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      put :update, id:511,type_of_ticket: {type_of_ticket: "Silver"}, format: :json
      response.should have_http_status(:not_found)
    end
    it "should not update the type_of_ticket with invalid attributes" do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      put :update, id:type_of_ticket.id, type_of_ticket: { type_of_ticket: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end 
  context 'DELETE #destroy' do
    it 'should not delete a type_of_ticket with invalid id' do
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      delete :destroy, id:555,format: :json
      response.should have_http_status(:not_found)
    end
  end
end