require 'rails_helper'

RSpec.describe ShowTimesController, type: :controller do
  context "GET #index" do
    it "should display all the show_times" do
      show_time = FactoryGirl.create(:show_time)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show show_time with given id" do
      show_time = FactoryGirl.create(:show_time)
      get :show, id: show_time.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit show_time with given id" do
      show_time = FactoryGirl.create(:show_time)
      get :edit, id: show_time.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid show_time with all attributes" do 
      post :create, show_time: { time: Faker::Time.forward(30, :morning) }, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the show_time with valid attributes" do
      show_time = FactoryGirl.create(:show_time)
      put :update, id:show_time.id, show_time: { time: show_time.time }, format: :json
      expect(response).to redirect_to show_time_path(show_time.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the show_time" do
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, id: show_time.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid show_time" do
      show_time = FactoryGirl.create(:show_time)
      get :show, id:500, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      show_time = FactoryGirl.create(:show_time)
      get :show,  id: 'ABC', format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid show_time" do
      show_time = FactoryGirl.create(:show_time)
      get :edit, id:500, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a show_time with nil values' do
      show_time= FactoryGirl.create(:show_time)
      post :create, show_time: {time: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update show_time with invalid id' do
      show_time = FactoryGirl.create(:show_time)
      put :update, id:511,show_time: {time: "10AM"}, format: :json
      response.should have_http_status(:not_found)
    end
    it "should not update the show_time with invalid attributes" do
      show_time = FactoryGirl.create(:show_time)
      put :update, id:show_time.id, show_time: { time: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end 
  context 'DELETE #destroy' do
    it 'should not delete a show_time with invalid id' do
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, id:555,format: :json
      response.should have_http_status(:not_found)
    end
  end
end