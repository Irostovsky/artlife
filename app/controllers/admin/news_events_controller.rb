class Admin::NewsEventsController < Admin::BaseController
  
  before_filter :find_news_event, :only => [:edit, :update, :destroy]
  
  def index
    @items = NewsEvent.all
  end
  
  def new
    @news_event = NewsEvent.new
  end
  
  def create
    @news_event = NewsEvent.new params[:news_event]
    if @news_event.save
      redirect_to admin_news_events_path, :notice => 'News Event added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @news_event.update_attributes params[:news_event]
      redirect_to admin_news_events_path, :notice => 'News Event updated!'
    else
      render :edit
    end
  end

  def destroy
    @news_event.destroy
    redirect_to admin_news_events_path, :notice => 'News Event deleted!'
  end

private

  def find_news_event
    @news_event = NewsEvent.find params[:id]
  end


end
