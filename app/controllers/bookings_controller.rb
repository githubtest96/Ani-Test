class BookingsController < ApplicationController
  def create
    _session_id = params[:session_id]
    _row = params[:selectedRow]
    _col = params[:selectedCol]

    _newBooking = Booking.new(session_id: params[:session_id], row: _row, column: _col)
    _newBooking.save

    render json: 'Success'.to_json, status: 200
  end
end
