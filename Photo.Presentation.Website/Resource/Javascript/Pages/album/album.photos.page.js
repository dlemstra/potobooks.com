var albumId = getParameterByName('albumId');
if (!albumId) {
    window.location = "../Default.aspx";
}

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
    $("#photoModal").modal("show");
});

$('#upload-album')
    .click(function () {
        var model = new FormData();
        model.append('Name', $("#phototitle").val());
        model.append('Description', $("#photodescription").val());
        model.append('AlbumId', parseInt(albumId));
        model.append('SourceFile', $('#file_import')[0].files[0]);

        $.ajax({
            url: "../Ajax/UploadPhoto.ashx",
            type: 'POST',
            dataType: 'json',
            data: model,
            processData: false,
            contentType: false,
            success: function (result) {
                $("#photoModal").modal("hide");
                $("form#album-creation-form")[0].reset();
                $.notify("Album created successfully", "success");
                window.location = "../Business/AlbumPhotos.aspx?albumId=" + albumId;
            },
            error: function (err) {
                $("#photoModal").modal("hide");
                $("form")[0].reset();
                $.notify("Album not created", "warn");
                window.location = "../Business/AlbumPhotos.aspx?albumId=" + albumId;
            }
        });
    });

function getAlbums() {
    var self = this;
    var albumTemplate = $("#tmpl-activity").html();
    $.ajax({
        url: "../Ajax/GetAlbumPhotos.ashx?albumId=" + getParameterByName('albumId'),
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
                name: 'Set as album cover',
                iconClass: 'specialedit icon-picture',
                onClick: function (row) {
                    console.log("'Add to Checkout' clicked on '" + row.AlbumName + "'");
                },
                isEnabled: function (row) {
                    return true;
                }
            },

            setPageNumber: {
                name: 'Set page number',
                iconClass: 'specialedit icon-list-ol',
                onClick: function (row) {
                    console.log("'Add to Checkout' clicked on '" + row.AlbumName + "'");
                },
                isEnabled: function (row) {
                    return true;
                }
            },

            deleteRow: {
                name: 'Delete this photo',
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

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}