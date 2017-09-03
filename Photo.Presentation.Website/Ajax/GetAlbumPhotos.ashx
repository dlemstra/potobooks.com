<%@ WebHandler Language="C#" Class="GetAlbumPhotos" %>

using System;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using Photo.Business.Entities.Album;

public class GetAlbumPhotos : IHttpHandler {

    public void ProcessRequest(HttpContext context) {
        string jsonResult = "";
        long albumId = System.Convert.ToInt64(context.Request.QueryString["albumId"]);
        var list = AlbumPhotosController.GetAllAlbumPhotos(albumId);
        if (list != null && list.ToList().Any()) {
            jsonResult = (new JavaScriptSerializer().Serialize(list));
        }
        context.Response.ContentType = "text/json";
        context.Response.Write(jsonResult);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
}