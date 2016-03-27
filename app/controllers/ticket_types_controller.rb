class TicketTypesController < ApplicationController
  def new
    @ticket_type = Event.find_by_id(params[:event]).ticket_types.new
  end
  def create
    @ticket_type = TicketType.new(ticket_type_params)
    if @ticket_type.save
      flash[:success] = "Create new ticket_type successful"
      redirect_to event_list_path
    else
      flash.now[:error] = "Create new ticket_type successful"
      render new_ticket_type_path
    end
  end

  private
    def ticket_type_params
      params.require(:ticket_type).permit!
    end
end
