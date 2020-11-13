$(document).ready(function() {

    // Booking ajax
    $(document).on('click', '.book-event', function() {
        const hallId = $('#hall-container').data('hall-id');
        const selectedRow = $(this).data('row');
        const selectedCol = $(this).data('col');
        const _this = $(this);

        $.ajax({
            method: "POST",
            url: `${hallId}/bookings`,
            data: {
                selectedRow,
                selectedCol
            },
            dataType: 'json',
            accept: 'json',
            beforeSend: function() {
                _this.attr("disabled", true)
            },
        });
    });

    // new session.
    const sessionData = {
        cinema_id: 0,
        hall_id: 0,
        film_id: 0
    }

    // Set cinema data
    $(document).on('change', '#cinema-options', function() {
        const _this = $(this);
        $.ajax({
            method: "GET",
            url: `/cinemas/${_this.val()}`,
            accept: 'json',
            success: function(data) {
                if (data) {
                    // show cinema halls
                    $('#hall-options').text('');
                    $('#hall-options').append(
                        data.halls.map((hall) => `<option value="${hall.id}">${hall.name}</option>`)
                        .join('')
                    );

                    // show cinema films
                    $('#film-options').text('');
                    $('#film-options').append(
                        data.films.map((film) => `<option value="${film.id}">${film.name}</option>`)
                        .join('')
                    );

                    $('#additional-inputs').show()
                }
            },
        });
    });

    // Create new Session
    $(document).on('submit', '#add-new-session', function(e) {
        e.preventDefault();

        const cinemaId = $('#cinema-options').val();
        const hallId = $('#hall-options').val();
        const filmId = $('#film-options').val();
        const startDate = $('#start-date-input').val();

        console.log('trying to submit', cinemaId, hallId, filmId, startDate);
        $.ajax({
            method: "POST",
            url: `/sessions`,
            data: {
                cinemaId,
                hallId,
                filmId,
                startDate
            },
            dataType: 'json',
            accept: 'json',
            beforeSend: function() {
                $('#NS-form-button').attr("disabled", true)
            },
            success: function(data) {
                $('#NS-form-button').attr("disabled", false)
                console.log(data);
            }
        });
    });
});