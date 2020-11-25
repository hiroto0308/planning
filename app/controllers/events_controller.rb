class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:destroy, :show, :edit, :update]
  before_action :login_user, only: [:destroy, :edit]
  
  def index
    @events = Event.includes(:user).order(created_at: :desc)
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

  def show
    @comment = Comment.new
    @comments = @event.comments.includes(:user).order(created_at: :desc)
  end 
  
  def edit
  end  

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit( :product, :introduction, :category_id,  :price, :time_all_id, :delivery_area_id, :start, :time_start).merge(user_id: current_user.id)
  end

  def login_user
    redirect_to root_path unless current_user.id == @event.user_id
  end

  def set_event
    @event = Event.find(params[:id])
  end  
end
