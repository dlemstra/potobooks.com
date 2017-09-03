<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Resource/Master/Album.master" CodeFile="AlbumPhotos.aspx.cs" Inherits="Business.BusinessAlbumPhotos" %>

<%@ Register Src="~/Resource/Control/AlbumHeader.ascx" TagPrefix="uc2" TagName="albumheader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <uc2:albumheader runat="server" ID="ucAlbumHeader" />
    <input type="hidden" id="apiUrl" runat="server" />
    <div id="app" class="row">
        <main id="main" role="main">
            <div id="grid" class="gridHomepage loaded" style="position: relative; height: 4127.9px;">

                <figure class="mediaCard gridItem" style="position: absolute; left: 298px; top: 0px;">
                    <div class="gridItemInner" style="background-color: lightgrey !important;">
                        <a href="#" class="thumbnailGridItem cardThumbnail addAlbum" style="padding-top: 77.0909090909091%">
                            <div class="articleListWrapper__imageCaption">
                                <i class="icon-plus-sign icon-6" style="font-size: 3em;"></i>
                            </div>
                        </a>
                        <div class="infoGridItem">
                            <h2 class="titleGridItem">
                                <a href="#" class="cardTitle addAlbum">Add new</a>
                            </h2>
                            <p class="categoryGridItem">
                                <a href="#" class="cardCategory">Photo</a>
                            </p>
                        </div>
                    </div>
                </figure>

                <div class="dynamic-grid">
                </div>

            </div>
        </main>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="photoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Add new photo</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-5 col-md-offset-3">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="sharedDesignsEmptyMessage">
                                            <div class="sharedDesignsEmptyMessage__inner" style="margin-top: 10px;">
                                                <img src="../Resource/Images/shared-empty-graphic.svg" class="sharedDesignsEmptyMessage__imageContainer selected-template" />
                                            </div>
                                        </div>
                                        <br />
                                        <div class="text-center">
                                            <form id="album-creation-form" role="form" autocomplete="off" class="form" method="post">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <label for="file_import">Select Photo:</label>
                                                        <input type="file" style="width: 95%;" accept="image/gif, image/jpg, image/jpeg, image/png" class="form-control" name="file_import" id="file_import" />
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="phototitle">Photo Title:</label>
                                                        <input style="width: 95%;" type="text"
                                                            id="phototitle" name="phototitle" placeholder="Photo title" class="form-control">
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="photodescription">Photo Description:</label>
                                                        <input style="width: 95%;" type="text"
                                                            id="photodescription" placeholder="Photo description" name="photodescription" class="form-control">
                                                    </div>
                                                </div>

                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" id="upload-album" class="btn btn-primary">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script id="tmpl-activity" type="text/mustache-template">
{{#albums}}
<figure class="mediaCard gridItem">
<div class="gridItemInner">
<a href="#" class="thumbnailGridItem cardThumbnail" data-label="Edit this template" style="padding-top: 77.0909090909091%">
<img src="../data/ImageThumbnails/_photo_{{AlbumImageID}}_250x250.png" alt="image path">
</a>
        <asp:button data-row-id="{{AlbumImageID}}" OnClientClick="return false;" class="button buttonSmall designCardMenuTrigger"><i style="color:black;cursor:pointer;margin-left: 8px;" class="icon-reorder"></i></asp:button>
<div class="infoGridItem">
<h2 class="titleGridItem">
<a href="#" class="cardTitle">{{AlbumImageName}}</a>
</h2>
<p class="categoryGridItem">
<a href="#" class="cardCategory">Photo</a>
</p>
</div>
</div>
</figure>
{{/albums}}
       
    </script>
    <script src="../Resource/Javascript/Pages/album/album.photos.page.js"></script>
</asp:Content>
