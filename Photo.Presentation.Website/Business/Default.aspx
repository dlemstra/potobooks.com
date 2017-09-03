<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Resource/Master/Album.master" CodeFile="Default.aspx.cs" Inherits="Business.BusinessDefault" %>

<%@ Register Src="~/Resource/Control/AlbumHeader.ascx" TagPrefix="uc1" TagName="SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <uc1:SignIn runat="server" ID="ucSignIn" />
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
                                <a href="#" class="cardCategory">Album</a>
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
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Add new album</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-5 col-md-offset-3">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="sharedDesignsEmptyMessage">
                                            <div class="sharedDesignsEmptyMessage__inner" style="margin-top: 10px;">
                                                <!-- slider -->
                                                <div class="row">
                                                    <div class="col-md-9" id="slider">
                                                        <!-- Top part of the slider -->
                                                        <div class="row">
                                                            <div class="col-md-2" id="carousel-bounding-box">
                                                                <div id="myCarousel" class="carousel slide">
                                                                    <!-- Carousel items -->
                                                                    <div class="carousel-inner">
                                                                        <div class="active item" data-slide-number="0">
                                                                            <img class="img-rounded img-responsive" src="../Resource/Pages/Preview/images/slider1.jpg">
                                                                        </div>
                                                                        <div class="item" data-slide-number="1">
                                                                            <img class="img-rounded img-responsive" src="../Resource/Pages/Preview/images/slider2.jpg">
                                                                        </div>
                                                                        <div class="item" data-slide-number="2">
                                                                            <img class="img-rounded img-responsive" src="../Resource/Pages/Preview/images/slider3.jpg">
                                                                        </div>
                                                                        <div class="item" data-slide-number="3">
                                                                            <img class="img-rounded img-responsive" src="../Resource/Pages/Preview/images/slider4.jpg">
                                                                        </div>
                                                                        <div class="item" data-slide-number="4">
                                                                            <img class="img-rounded img-responsive" src="../Resource/Pages/Preview/images/slider5.jpg">
                                                                        </div>
                                                                    </div>
                                                                    <!--/carousel-inner-->
                                                                </div>
                                                                <!--/carousel-->
                                                                <ul class="carousel-controls-mini list-inline text-center">
                                                                    <li><a href="#myCarousel" data-slide="prev">‹</a></li>
                                                                    <li><a href="#myCarousel" data-slide="next">›</a></li>
                                                                </ul>
                                                                <!--/carousel-controls-->
                                                            </div>
                                                            <!--/col-->
                                                        </div>
                                                        <!--/col-->
                                                    </div>
                                                    <!--/row slider-->
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="text-center">
                                            <form id="album-creation-form" role="form" autocomplete="off" class="form" method="post">
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <label for="file_import">Select Album Cover :</label>
                                                        <input type="file" style="width: 95%;" accept="image/gif, image/jpg, image/jpeg, image/png" class="form-control" name="file_import" id="file_import" />
                                                        <div class="clearfix"></div>
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="albumtitle">Album Title:</label>
                                                        <input style="width: 95%;" type="text"
                                                            id="albumtitle" name="displaydata" placeholder="album title" class="form-control">
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="albumdescription">Album Description:</label>
                                                        <input style="width: 95%;" type="text"
                                                            id="albumdescription" placeholder="Album description" name="albumdescription" class="form-control">
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="softcover" class="checkboxlabel">
                                                            Softcover from $9.99
                                                           <p style="color: #414141; opacity: 0.6;">
                                                               7-inch square, 20 pages 
                                                           </p>
                                                        </label>
                                                        <input type="radio" class="checkbox checkbboxinput" style="margin-top: -75px;" id="softcover" name="covertype" value="1">
                                                        <div class="clear"></div>
                                                    </div>
                                                    <div class="input-group">
                                                        <label for="hardcover" class="checkboxlabel">
                                                            Hard Cover Book
                                                              <p style="color: #414141; opacity: 0.6;">
                                                                  9-inch square, 20 pages 
                                                              </p>
                                                        </label>
                                                        <input type="radio" class="checkbox checkbboxinput" id="hardcover" style="margin-top: -75px;" name="covertype" value="2">
                                                        <div class="clear"></div>
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
<img src="../data/ImageThumbnails/_album_{{AlbumId}}_250x250.png" alt="image path">
</a>
        <asp:button data-row-id="{{AlbumId}}" OnClientClick="return false;" class="button buttonSmall designCardMenuTrigger"><i style="color:black;cursor:pointer;margin-left: 8px;" class="icon-reorder"></i></asp:button>
<div class="infoGridItem">
<h2 class="titleGridItem">
<a href="AlbumPhotos.aspx?albumId={{AlbumId}}" class="cardTitle">{{AlbumName}}</a>
</h2>
<p class="categoryGridItem">
<a href="#" class="cardCategory">Album</a>
</p>
</div>
</div>
</figure>
{{/albums}}
       
    </script>
    <script src="../Resource/Javascript/Pages/album/album.page.js"></script>
</asp:Content>
