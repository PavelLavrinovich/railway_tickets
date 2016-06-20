$(document).ready(function () {
    $('.find-form').submit(function () {
        var startStation = $(this).find('#start_station_id');
        var endStation = $(this).find('#end_station_id');

        if(startStation.val() == endStation.val()) {
            alert('Choose a end station.');
            return false;
        }
    });
});
