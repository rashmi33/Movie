class MovieHallsController < ApplicationController
	protect_from_forgery
  def index
    @movie_halls = MovieHall.all
    respond_to do |format|
      format.json { render :json => {:movie_halls => @movie_halls}, status: :ok}
      format.html
    end
  end

  def show
    begin
      @movie_hall = MovieHall.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:movie_hall => @movie_hall}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @movie_hall = MovieHall.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:movie_hall => @movie_hall}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
 
  def create
  	@movie_hall = MovieHall.new(movie_hall_params)
    if @movie_hall.save
      respond_to do |format|
        format.json { render :json => {:movie_hall => @movie_hall}, status: :ok}
        format.html { redirect_to movie_halls_path}
      end
    else
      respond_to do |format|
        format.json { render :json => {:movie_hall => @movie_hall.errors}, status: :unprocessable_entity}
        format.html { redirect_to new_movie_hall_path}
      end
    end
  end

  def update
    begin
      @movie_hall = MovieHall.find(params[:id])
      if @movie_hall.update(movie_hall_params)
        redirect_to @movie_hall
      else
        respond_to do |format|
          format.json { render :json => {:movie_hall => @movie_hall.errors}, status: :unprocessable_entity}
          format.html { redirect_to edit_movie_hall_path}
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
  
  def destroy
    begin
      @movie_hall = MovieHall.find(params[:id])
      if @movie_hall.destroy
        respond_to do |format|
          format.json { render :json => {:message => "Movie Hall was deleted successfully"}, status: :ok}
          format.html { redirect_to movie_halls_path}
        end
      else
        respond_to do |format|
          format.json { render :json => {:movie_hall => @movie_hall.errors}, status: :unprocessable_entity}
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end

  private
  def movie_hall_params
    params.require(:movie_hall).permit(:name, :address, :city)
  end
end