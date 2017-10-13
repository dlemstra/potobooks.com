
//refineURL() gives us the freedom to alter the URL string based on your needs. 
var loginNewURL = refineURL();
window.history.pushState("object or string", "Title", "/" + loginNewURL);
//Helper function to extract the URL between the last '/' and before '?' 
function refineURL() {
	//get full URL
	var currUrl = window.location.href; //get current address
	//Get the URL between what's after '/' and befor '?' 
	//1- get URL after'/'
	var afterDomain = currUrl.substring(currUrl.lastIndexOf('/') + 1);
	//2- get the part before '?'
	var beforeQueryString = afterDomain.split("?")[0];
	return beforeQueryString;
}

function showModal() {
	$('#loginModal').modal('show');
}

$(function() {
    refreshAllInputs();
    $("#loginModal").modal("show");

    $("#user-login")
        .click(function() {
            refreshAllInputs();
            $("#loginModal").modal("show");
        });

    function refreshAllInputs() {
        $('.txtEmailAddress').parent().removeClass('field_with_errors');
        $('.txtEmailAddress').parent().find('label').removeClass('force-red');
        $('.txtCKPassword').parent().removeClass('field_with_errors');
        $('.txtCKPassword').parent().find('label').removeClass('force-red');
        $('.txtCKPassword').parent().css('margin-top', '0px');
        $('.loginModal label.with-checkbox').parent().css('margin-top', '0px');
        $(".alert-warning").hide();
    }
});