$(document).ready(function () {
    $('#type_id').change(function () {
        var form = $('.displayed');
        if (form) {
            form.removeClass('displayed');
            form.hide();
        }
        var type = $(this).val();
        form = $('#' + type);
        form.addClass('displayed');
        form.show();
    });
});

