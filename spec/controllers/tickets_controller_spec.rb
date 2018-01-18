require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context "GET #index" do
    it "should display all the tickets" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show ticket with given id" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      get :show, params:{id: ticket.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit ticket with given id" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      get :edit, params:{ id: ticket.id }, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid ticket with all attributes" do 
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      post :create,  params: { ticket: { code: "A7878A", seat_no: Faker::Number.number(10),show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id}}, format: :json
      response.should have_http_status(:ok)
    end

    it "should create a valid ticket with mandatory attributes only" do 
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      post :create, params: {ticket: { code: "A7878A",show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id}}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the ticket with valid attributes" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      put :update, params: {id:ticket.id, ticket: { code: ticket.code, seat_no: ticket.seat_no}}, format: :json
      expect(response).to redirect_to ticket_path(ticket.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the ticket" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      delete :destroy,params: { id: ticket.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid ticket" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      get :show, params: {id:500}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      get :show, params: { id: 'ABC' }, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid ticket" do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      get :edit, params: {id:500}, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a ticket with invalid attributes' do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      post :create,  params: {ticket: {code: "A787",show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id}},format: :json
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not create a ticket with nil values' do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      post :create, params: {ticket: {code: nil}}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update ticket with invalid id' do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      put :update, params: {id:511,ticket: {code: "AB111C"}}, format: :json
      response.should have_http_status(:not_found)
    end
  end 
  context 'DELETE #destroy' do
    it 'should not delete a ticket with invalid id' do
      show_time = FactoryGirl.create(:show_time)
      type_of_ticket = FactoryGirl.create(:type_of_ticket)
      ticket = FactoryGirl.create(:ticket ,show_time_id: show_time.id, type_of_ticket_id: type_of_ticket.id)
      delete :destroy, params: {id:555},format: :json
      response.should have_http_status(:not_found)
    end
  end
end