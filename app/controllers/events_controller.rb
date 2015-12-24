class EventsController < ApplicationController
  before_action :set_event, only: [:show]

  # GET /events/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
end