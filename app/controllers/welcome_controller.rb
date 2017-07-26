class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]


  def index
    @events = Event.all
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :content, :location, :date, :images)
  end
end
