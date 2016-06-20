$(document).ready(function () {
    $('a.edit-route').click(function (e) {
        e.preventDefault();
        var routeId = $(this).data('routeId');
        var form = $('#edit_route_' + routeId);
        var name = $('p#route_name_' + routeId);

        if ($(this).hasClass('cancel')) {
            $(this).html('Edit');
            $(this).removeClass('cancel');
        } else {
            $(this).html('Cancel');
            $(this).addClass('cancel');
        }

        form.toggle();
        name.toggle();
    });
});

