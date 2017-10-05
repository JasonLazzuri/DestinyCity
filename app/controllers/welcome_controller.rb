class WelcomeController < ApplicationController


  def index
    @number = rand(1..15)
    @events = Event.all
    @remoteip = request.remote_ip

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
