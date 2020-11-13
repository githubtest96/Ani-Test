class CinemasController < ApplicationController
  def show
    _cinema = Cinema.find(params[:id])

    logger.debug "_cinema: #{_cinema}"

    render json: _cinema.to_json({
       :include => {
           :films => { only: [:id, :name, :duration] },
           :halls => { only: [:id, :name] }
       }
   })
  end
end
