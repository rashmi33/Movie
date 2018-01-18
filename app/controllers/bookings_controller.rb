class BookingsController < ApplicationController
	protect_from_forgery
  def index
    @bookings = Booking.all
    respond_to do |format|
      format.json { render :json => {:bookings => @bookings}, status: :ok}
      format.html
    end
  end

  def show
    begin
      @booking = Booking.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:booking => @booking}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @booking = Booking.find(params[:id])
      respond_to do |format|
        format.json { render :json => {:booking => @booking}, status: :ok}
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
 
  def create
  	@booking = Booking.new(booking_params)
    if @booking.save
      respond_to do |format|
        format.json { render :json => {:booking => @booking}, status: :ok}
        format.html { redirect_to bookings_path}
      end
    else
      respond_to do |format|
        format.json { render :json => {:booking => @booking.errors}, status: :unprocessable_entity}
        format.html { redirect_to new_booking_path}
      end
    end
  end

  def update
    begin
      @booking = Booking.find(params[:id])
      if @booking.update(booking_params)
        redirect_to @booking
      else
        respond_to do |format|
          format.json { render :json => {:booking => @booking.errors}, status: :unprocessable_entity}
          format.html { redirect_to edit_booking_path}
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end
  
  def destroy
    begin
      @booking = Booking.find(params[:id])
      if @booking.destroy
        respond_to do |format|
          format.json { render :json => {:message => "Booking was deleted successfully"}, status: :ok}
          format.html { redirect_to bookings_path}
        end
      else
        respond_to do |format|
          format.json { render :json => {:booking => @booking.errors}, status: :unprocessable_entity}
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: {error: e.message}, status: :not_found
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:date_of_movie, :no_of_persons, :amount, :seats_alloted,:user_id, :ticket_id, :movie_id)
  end
end