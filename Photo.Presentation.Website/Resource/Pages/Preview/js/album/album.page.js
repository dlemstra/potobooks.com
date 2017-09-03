$("#file_import").change(function () {
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('.selected-template').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$(".addAlbum").click(function () {
    $("#myModal").modal("show");
});

$('#upload-album')
    .click(function () {
        var model = new FormData();
        model.append('Name', $("#albumtitle").val());
        model.append('Description', $("#albumdescription").val());
        model.append('AlbumType', parseInt($('input[name=covertype]:checked').val(), 9));
        model.append('SourceFile', $('#file_import')[0].files[0]);

        $.ajax({
            url: "../Ajax/UploadAlbum.ashx",
            type: 'POST',
            dataType: 'json',
            data: model,
            processData: false,
            contentType: false,
            success: function (result) {
                $("#myModal").modal("hide");
                $("form#album-creation-form")[0].reset();
                $.notify("Album created successfully", "success");
                window.location = "Business/Default.aspx";
            },
            error: function (err) {
                $("#myModal").modal("hide");
                $("form")[0].reset();
                $.notify("Album not created", "warn");
                window.location = "Default.aspx";
            }
        });
    });

function getAlbums() {
    var self = this;
    var albumTemplate = $("#tmpl-activity").html();
    $.ajax({
        url: "../Ajax/GetAlbums.ashx",
        type: 'Get',
        dataType: 'json',
        success: function (data) {
            if (data != null && data.length > 0) {
                var albums = { 'albums': data };
                var htm = Mustache.render(albumTemplate, albums);
                $('.dynamic-grid').html(htm);
                setTimeout(function () {
                    responsiveManager.makeResponsiveLayout();
                    ContextMenu(data);
                }, 200);
            }
        },
        error: function () {
            setTimeout(responsiveManager.makeResponsiveLayout, 200);
        }
    });
}

function GetAlbum(albums, rowId) {
    return $.grep(albums,
        function (data) {
            return data.AlbumId === rowId;
        })[0];
}

function ContextMenu(albums) {

    var menu = new BootstrapMenu('.designCardMenuTrigger', {
        menuEvent: 'click',
        fetchElementData: function ($rowElem) {
            var rowId = $rowElem.data('rowId'), album = {};

            return GetAlbum(albums, rowId);
        },
        actions: {
            editName: {
                name: 'Add to Checkout',
                iconClass: 'specialedit icon-shopping-cart',
                onClick: function (row) {
                    console.log("'Add to Checkout' clicked on '" + row.AlbumName + "'");
                },
                isEnabled: function (row) {
                    return true;
                }
            },

            deleteRow: {
                name: 'Delete this album',
                iconClass: 'specialedit icon-trash',
                onClick: function (row) {
                    console.log("'Delete row' clicked on '" + row.AlbumName + "'");
                },
                isEnabled: function (row) {
                    return true;
                }
            }
        }
    });
}

getAlbums();

$('#myCarousel').carousel({
    interval: 2000
});