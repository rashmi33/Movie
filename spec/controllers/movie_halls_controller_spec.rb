require 'rails_helper'

RSpec.describe MovieHallsController, type: :controller do
  context "GET #index" do
    it "should display all the movie_halls" do
      movie_hall = FactoryGirl.create(:movie_hall)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show movie_hall with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      get :show, params:{id: movie_hall.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit movie_hall with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      get :edit, params:{id: movie_hall.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid movie_hall with all attributes" do 
      post :create,  params: { movie_hall: { name: Faker::Name.first_name, address: Faker::Address.street_address, city: Faker::Address.city, no_of_screens: Faker::Number.digit}}, format: :json
      response.should have_http_status(:ok)
    end

    it "should create a valid movie_hall with mandatory attributes only" do 
      movie_hall = FactoryGirl.create(:movie_hall)
      post :create, params: {movie_hall: { name: movie_hall.name, address: movie_hall.address, city: movie_hall.city}}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the movie_hall with valid attributes" do
      movie_hall = FactoryGirl.create(:movie_hall)
      put :update, params: {id:movie_hall.id, movie_hall: { name: movie_hall.name, address: movie_hall.address, city: movie_hall.city, no_of_screens: movie_hall.no_of_screens}}, format: :json
      expect(response).to redirect_to movie_hall_path(movie_hall.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the movie_hall" do
      movie_hall = FactoryGirl.create(:movie_hall)
      delete :destroy,params: { id: movie_hall.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid movie_hall" do
      movie_hall = FactoryGirl.create(:movie_hall)
      get :show, params: {id:500}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid movie_hall attribute" do
      movie_hall = FactoryGirl.create(:movie_hall)
      get :show, params: { id: 'ABC' }, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid movie_hall" do
      movie_hall = FactoryGirl.create(:movie_hall)
      get :edit, params: {id:500}, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a movie_hall with invalid attributes' do
      post :create,  params: {movie_hall: {name: Faker::Name.first_name}},format: :json
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not create a movie_hall with nil values' do
      movie_hall= FactoryGirl.create(:movie_hall)
      post :create, params: {movie_hall: {name: nil}}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update movie_hall with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      put :update, params: {id:511,movie_hall: {name: "ABC"}}, format: :json
      response.should have_http_status(:not_found)
    end
  end 
  context 'DELETE #destroy' do
    it 'should not delete a movie_hall with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      delete :destroy, params: {id:555},format: :json
      response.should have_http_status(:not_found)
    end
  end
end
