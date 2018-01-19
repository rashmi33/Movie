class TicketsController < ApplicationController
	protect_from_forgery
  def index
    @tickets = Ticket.all
    respond_to do |format|
      format.json { render :json => { :tickets => @tickets }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @ticket = Ticket.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :ticket => @ticket }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @ticket = Ticket.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :ticket => @ticket }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@ticket = Ticket.new(ticket_params)
    if @ticket.save
      respond_to do |format|
        format.json { render :json => { :ticket => @ticket }, status: :ok }
        format.html { redirect_to tickets_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :ticket => @ticket.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_ticket_path }
      end
    end
  end

  def update
    begin
      @ticket = Ticket.find(params[:id])
      if @ticket.update(ticket_params)
        redirect_to @ticket
      else
        respond_to do |format|
          format.json { render :json => { :ticket => @ticket.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_ticket_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @ticket = Ticket.find(params[:id])
      if @ticket.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'Ticket was deleted successfully' }, status: :ok }
          format.html { redirect_to tickets_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :ticket => @ticket.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:code, :seat_no, :type_of_ticket_id, :show_time_id)
  end
end