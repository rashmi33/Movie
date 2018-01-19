class TypeOfTicketsController < ApplicationController
	protect_from_forgery
  def index
    @type_of_tickets = TypeOfTicket.all
    respond_to do |format|
      format.json { render :json => { :type_of_tickets => @type_of_tickets }, status: :ok }
      format.html
    end
  end

  def show
    begin
      @type_of_ticket = TypeOfTicket.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :type_of_ticket => @type_of_ticket }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @type_of_ticket = TypeOfTicket.find(params[:id])
      respond_to do |format|
        format.json { render :json => { :type_of_ticket => @type_of_ticket }, status: :ok }
        format.html
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
 
  def create
  	@type_of_ticket = TypeOfTicket.new(type_of_ticket_params)
    if @type_of_ticket.save
      respond_to do |format|
        format.json { render :json => { :type_of_ticket => @type_of_ticket }, status: :ok }
        format.html { redirect_to type_of_ticket_path }
      end
    else
      respond_to do |format|
        format.json { render :json => { :type_of_ticket => @type_of_ticket.errors }, status: :unprocessable_entity }
        format.html { redirect_to new_type_of_ticket_path }
      end
    end
  end

  def update
    begin
      @type_of_ticket = TypeOfTicket.find(params[:id])
      if @type_of_ticket.update(type_of_ticket_params)
        redirect_to @type_of_ticket
      else
        respond_to do |format|
          format.json { render :json => { :type_of_ticket => @type_of_ticket.errors }, status: :unprocessable_entity }
          format.html { redirect_to edit_type_of_ticket_path }
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
  
  def destroy
    begin
      @type_of_ticket = TypeOfTicket.find(params[:id])
      if @type_of_ticket.destroy
        respond_to do |format|
          format.json { render :json => { :message => 'Type Of Tickets was deleted successfully' }, status: :ok }
          format.html { redirect_to type_of_tickets_path }
        end
      else
        respond_to do |format|
          format.json { render :json => { :type_of_ticket => @type_of_ticket.errors }, status: :unprocessable_entity }
          format.html
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private
  def type_of_ticket_params
    params.require(:type_of_ticket).permit(:type_of_ticket)
  end
end