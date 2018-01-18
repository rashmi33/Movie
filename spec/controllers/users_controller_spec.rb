require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context "GET #index" do
    it "should display all the users" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show user with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      get :show, id: user.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit user with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      get :edit, id: user.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid user with all attributes" do 
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      post :create,  user: { name: Faker::Name.first_name, address: Faker::Address.street_address, phone_no: Faker::Number.number(10), audi_id: audi.id, movie_hall_id:movie_hall.id}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the user with valid attributes" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      put :update, id:user.id, user: { name: user.name, address: user.address, city: user.city}, format: :json
      expect(response).to redirect_to user_path(user.id)
    end 
  end

  context "DELETE #destroy" do
    it "should delete the user" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      delete :destroy, id: user.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid user" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      get :show, id:500, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      get :show, id: 'ABC', format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid user" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      get :edit, id:500, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a user with invalid attributes' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      post :create, user: {name: Faker::Date.forward(30)},format: :json
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not create a user with nil values' do
      user= FactoryGirl.create(:user)
      post :create, user: {name: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update user with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      put :update, id:511, user: {name: "ABC"}, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'DELETE #destroy' do
    it 'should not delete a user with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      user = FactoryGirl.create(:user ,movie_hall_id: movie_hall.id, audi_id: audi.id)
      delete :destroy, id:555,format: :json
      response.should have_http_status(:not_found)
    end
  end
end