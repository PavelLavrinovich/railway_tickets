$(document).ready(function () {
    $('a.edit-train').click(function (e) {
        e.preventDefault();
        var trainId = $(this).data('trainId');
        var form = $('#edit_train_' + trainId);
        var number = $('p#train_number_' + trainId);

        if ($(this).hasClass('cancel')) {
            $(this).html('Edit');
            $(this).removeClass('cancel');
        } else {
            $(this).html('Cancel');
            $(this).addClass('cancel');
        }

        form.toggle();
        number.toggle();
    });
});
