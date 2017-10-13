function validatePage() {
    var valid = true;
    $(".animated-input").each(function (index, el) {
        if ($(el).val() === '') {
            $(el).parent().addClass('field_with_errors');
            $(el).parent().find('label').addClass('force-red');
            valid = false;
        }
    });
    return valid;
}