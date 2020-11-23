class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def event_params
    params.require(:event).permit( :product, :introduction, :category_id,  :price, :time_all_id, :delivery_area_id, :start).merge(user_id: current_user.id)
  end
end
