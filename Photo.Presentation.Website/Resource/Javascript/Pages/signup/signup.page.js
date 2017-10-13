function showModal() {
    $('#loginSignup').modal('show');
}

$(function () {
    $("#loginSignup").modal("show");
    refreshAllInputs();

    $(".reset-password-link")
        .click(function () {
            $("#myModal").modal("hide");
            $("#loginSignup").modal("hide");
            $("#loginForgotPassword").modal('show');
        });

    function refreshAllInputs() {
        $(".animated-input")
            .each(function (index, el) {
                $(el).parent().removeClass('field_with_errors');
                $(el).parent().find('label').removeClass('force-red');
                $(".alert-warning").hide();
            });
    }
});