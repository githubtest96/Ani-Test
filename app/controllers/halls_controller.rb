class HallsController < ApplicationController
  def show
    @hall = Hall.find(params[:id])

    @session_bookings = Booking.where('session_id', params[:session_id])
    @row_index = 0
    @col_index = 0
  end
end
