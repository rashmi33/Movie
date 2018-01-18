require 'rails_helper'

RSpec.describe AudisController, type: :controller do
  context "GET #index" do
    it "should display all the audis" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show audi with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      get :show, params:{id: audi.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit audi with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      get :edit, params:{id: audi.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid audi with all attributes" do 
      movie_hall = FactoryGirl.create(:movie_hall)
      post :create,  params: { audi: { code: "A7878A", no_of_seats: Faker::Number.number(2), movie_hall_id:movie_hall.id}}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the audi with valid attributes" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      put :update, params: {id:audi.id, audi: { code: audi.code, no_of_seats: audi.no_of_seats}}, format: :json
      expect(response).to redirect_to audi_path(audi.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the audi" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      delete :destroy,params: { id: audi.id}, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid audi" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      get :show, params: {id:500}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      get :show, params: { id: 'ABC' }, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid audi" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      get :edit, params: {id:500}, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a audi with invalid attributes' do
      movie_hall = FactoryGirl.create(:movie_hall)
      post :create,  params: {audi: {code:  "A7878A"}},format: :json
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not create a audi with nil values' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      post :create, params: {audi: {code: nil}}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update audi with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      put :update, params: {id:511,audi: {code: "ABC111"}}, format: :json
      response.should have_http_status(:not_found)
    end
  end 
  
  context 'DELETE #destroy' do
    it 'should not delete a audi with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi ,movie_hall_id: movie_hall.id)
      delete :destroy, params: {id:555},format: :json
      response.should have_http_status(:not_found)
    end
  end
end