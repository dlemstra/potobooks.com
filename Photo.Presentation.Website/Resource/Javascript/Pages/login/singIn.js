function validatePage() {
    var check = true;
    if ($('.txtEmailAddress').val() === '') {
        $('.txtEmailAddress').parent().addClass('field_with_errors');
        $('.txtEmailAddress').parent().find('label').addClass('force-red');
        check = false;
    }
    if ($('.txtCKPassword').val() === '') {
        $('.txtCKPassword').parent().addClass('field_with_errors');
        $('.txtCKPassword').parent().find('label').addClass('force-red');
        check = false;
    }

    if ($('.txtEmailAddress').val() === '' || $('#txtCKPassword').val() === '') {
        $('.txtCKPassword').parent().css('margin-top', '14px');
        $('.loginModal label.with-checkbox').parent().css('margin-top', '12px');
        check = false;
    }
    return check;
}
