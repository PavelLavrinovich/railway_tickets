$(document).ready(function () {
    $('a.edit-station').click(function (e) {
        e.preventDefault();
        var stationId = $(this).data('stationId');
        var form = $('#edit_railway_station_' + stationId);
        var title = $('p#railway_station_title_' + stationId);

        if ($(this).hasClass('cancel')) {
            $(this).html('Edit');
            $(this).removeClass('cancel');
        } else {
            $(this).html('Cancel');
            $(this).addClass('cancel');
        }

        form.toggle();
        title.toggle();
    });
});

