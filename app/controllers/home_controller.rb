class HomeController < ApplicationController
  def index
    @news_events = NewsEvent.all
  end
end
