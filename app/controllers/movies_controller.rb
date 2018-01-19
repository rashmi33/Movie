class MoviesController < ApplicationController
  protect_from_forgery
  def index
    @movies = Movie.all
    respond_to do |format|
      format.json { render :json => { :movies => @movies }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @movie = Movie.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :movie => @movie }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @movie = Movie.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :movie => @movie }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      respond_to do |format|
        format.json { render :json => { :movie => @movie }, status: :ok }
        format.html { redirect_to movies_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :movie => @movie.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_movie_path }
      end
    end
  end

  def update
    begin
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to @movie
      else
        respond_to do |format|
          format.json { render :json => { :movie => @movie.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_movie_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @movie = Movie.find(params[:id])
      if @movie.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'Movie was deleted successfully' }, status: :ok }
          format.html { redirect_to movies_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :movie => @movie.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :duration, :movie_type, :genre, :is_bollywood, :rating)
  end
end