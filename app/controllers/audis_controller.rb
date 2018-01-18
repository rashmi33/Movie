class AudisController < ApplicationController
	protect_from_forgery
  def index
    @audis = Audi.all
    respond_to do |format|
      format.json { render :json => {:audis => @audis}, status: :ok}
      format.html
    end
  end

  def show
    begin
      @audi = Audi.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:audi => @audi}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @audi = Audi.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:audi => @audi}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
 
  def create
  	@audi = Audi.new(audi_params)
    if @audi.save
      respond_to do |format|
        format.json { render :json => {:audi => @audi}, status: :ok}
        format.html { redirect_to audis_path}
      end
    else
      respond_to do |format|
        format.json { render :json => {:audi => @audi.errors}, status: :unprocessable_entity}
        format.html { redirect_to new_audi_path}
      end
    end
  end

  def update
    begin
      @audi = Audi.find(params[:id])
      if @audi.update(audi_params)
        redirect_to @audi
      else
        respond_to do |format|
          format.json { render :json => {:audi => @audi.errors}, status: :unprocessable_entity}
          format.html { redirect_to edit_audi_path}
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
  
  def destroy
    begin
      @audi = Audi.find(params[:id])
      if @audi.destroy
        respond_to do |format|
          format.json { render :json => {:message => "Audi was deleted successfully"}, status: :ok}
          format.html { redirect_to audis_path}
        end
      else
        respond_to do |format|
          format.json { render :json => {:audi => @audi.errors}, status: :unprocessable_entity}
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end

  private
  def audi_params
    params.require(:audi).permit(:code, :no_of_seats, :movie_hall_id)
  end
end