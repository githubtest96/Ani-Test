class SessionsController < ApplicationController
  def index
    @sessions = Session.order(start_date: :desc).all
  end

  def new
    @cinemas = Cinema.order(name: :desc).all
  end

  def create
    _start_date = DateTime.parse(params[:startDate])
    _cinemaId = params[:cinemaId]
    _hall_id = params[:hallId]
    _film_id = params[:filmId]
    _hall_sessions = Session.where(cinema_id: _cinemaId, hall_id: _hall_id).select(:start_date)
    _film = Film.find(_film_id)
    _end_date = get_session_end_date(_start_date, _film.duration)

    if is_start_date_valid(_start_date, _end_date, _hall_sessions)
      _newSession = Session.create(cinema_id: _cinemaId, hall_id: _hall_id, film_id: _film_id, start_date: _start_date)
    end
  end

  private
    def is_start_date_valid(_start_date, _end_date, _hall_sessions)

      _hall_sessions.each do |session|
        _session_end_date = get_session_end_date(session.start_date, session.film.duration)
        if (_start_date > session.start_date && _start_date < _session_end_date) || (_end_date > session.start_date && _end_date < _session_end_date)
          return false
        end
      end

      return true
    end

    def get_session_end_date(_start_date, _duration)
      _duration_hour = _duration.hour
      _duration_min = _duration.min + 15
      _end_date = _start_date + _duration_hour.hours + _duration_min.minutes

      return _end_date
    end
end
