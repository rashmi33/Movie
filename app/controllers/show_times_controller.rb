class ShowTimesController < ApplicationController
	protect_from_forgery
  def index
    @show_times = ShowTime.all
    respond_to do |format|
      format.json { render :json => {:show_times => @show_times}, status: :ok}
      format.html
    end
  end

  def show
    begin
      @show_time = ShowTime.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :show_time => @show_time }, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @show_time = ShowTime.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:show_time => @show_time}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
 
  def create
  	@show_time = ShowTime.new(show_time_params)
    if @show_time.save
      respond_to do |format|
        format.json { render :json => {:show_time => @show_time}, status: :ok}
        format.html { redirect_to show_times_path}
      end
    else
      respond_to do |format|
        format.json { render :json => {:show_time => @show_time.errors}, status: :unprocessable_entity}
        format.html { redirect_to new_show_time_path}
      end
    end
  end

  def update
    begin
      @show_time = ShowTime.find(params[:id])
      if @show_time.update(show_time_params)
        redirect_to @show_time
      else
        respond_to do |format|
          format.json { render :json => {:show_time => @show_time.errors}, status: :unprocessable_entity}
          format.html { redirect_to edit_show_time_path}
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
  
  def destroy
    begin
      @show_time = ShowTime.find(params[:id])
      if @show_time.destroy
        respond_to do |format|
          format.json { render :json => {:message => "Show Time was deleted successfully"}, status: :ok}
          format.html { redirect_to show_times_path}
        end
      else
        respond_to do |format|
          format.json { render :json => {:show_time => @show_time.errors}, status: :unprocessable_entity}
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end

  private
  def show_time_params
    params.require(:show_time).permit(:time)
  end
end