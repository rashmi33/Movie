require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context "GET #index" do
    it "should display all the movies" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should show movie with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      get :show, id: movie.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #edit" do
    it "should edit movie with given id" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      get :edit, id: movie.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "POST #create" do 
    it "should create a valid movie with all attributes" do 
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      post :create,  movie: { name: Faker::Date.forward(30), duration: Faker::Number.number(3), movie_type: 'U', is_bollywood: "true",genre: Faker::Name.first_name, rating: Faker::Number.number(1), movie_hall_id: movie_hall.id, audi_id: audi.id}, format: :json
      response.should have_http_status(:ok)
    end

    it "should create a valid movie with mandatory attributes only" do 
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      post :create, movie: { name: Faker::Date.forward(30), movie_type: 'U', rating: Faker::Number.number(1), movie_hall_id: movie_hall.id, audi_id: audi.id}, format: :json
      response.should have_http_status(:ok)
    end
  end 

  context "PUT #update" do
    it "should update the movie with valid attributes" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      put :update, id:movie.id, movie: { name: movie.name, duration: movie.duration, movie_type: movie.movie_type, is_bollywood: movie.is_bollywood,genre: movie.genre, rating: movie.rating}, format: :json
      expect(response).to redirect_to movie_path(movie.id)
    end
  end

  context "DELETE #destroy" do
    it "should delete the movie" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      delete :destroy,  id: movie.id, format: :json
      response.should have_http_status(:ok)
    end
  end

  context "GET #show" do
    it "should not show invalid movie" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      get :show, id:500, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
    it "should not show invalid attribute" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      get :show, id: 'ABC' , format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context "GET #edit" do
    it "should not edit invalid movie" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      get :edit, id:500, format: :json
      response.should have_http_status(:not_found)
    end
  end

  context 'POST #create' do
    it 'should not create a movie with invalid attributes' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      post :create, movie: {name: Faker::Date.forward(30)},format: :json
      response.should have_http_status(:unprocessable_entity)
    end

    it 'should not create a movie with nil values' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      post :create, movie: {name: nil}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT #update' do
    it 'should not update movie with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      put :update,id:511,movie: {name: "ABC"}, format: :json
      response.should have_http_status(:not_found)
    end
    it "should not update the movie with invalid attributes" do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      put :update, id:movie.id, movie: { name: nil, duration: movie.duration, movie_type: movie.movie_type, is_bollywood: movie.is_bollywood,genre: movie.genre, rating: movie.rating}, format: :json
      response.should have_http_status(:unprocessable_entity)
    end
  end 
  context 'DELETE #destroy' do
    it 'should not delete a movie with invalid id' do
      movie_hall = FactoryGirl.create(:movie_hall)
      audi = FactoryGirl.create(:audi)
      movie = FactoryGirl.create(:movie ,movie_hall_id: movie_hall.id,audi_id: audi.id)
      delete :destroy, id:555,format: :json
      response.should have_http_status(:not_found)
    end
  end
end
