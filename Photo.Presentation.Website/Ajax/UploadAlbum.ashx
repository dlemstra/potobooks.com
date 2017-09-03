<%@ WebHandler Language="C#" Class="UploadAlbum" %>

using System;
using System.Configuration;
using System.IO;
using System.Reflection;
using System.Web;
using Helper;
using Photo.Business.Entities.Album;
using Photo.Business.Entities.Model;
using Photo.Business.Entities.Security;
using Photo.Business.Utilities.ImagePreview;
using Photo.Business.Utilities.Storage;
using Photo.Utility.LogHelper;

public class UploadAlbum : IHttpHandler {

    #region Private Members

    private UserInfo _user;

    #endregion


    public UserInfo User {
        get { return _user ?? (_user = SecurityHelper.GetCurrentUser()); }
    }

    public void ProcessRequest(HttpContext context) {

        LogHelper.Log(Logger.Application, LogLevel.Info, "UploadAlbum - Entry");

        // get variables first
        var nvc = HttpContext.Current.Request.Form;
        var request = new AlbumDto();
        // iterate through and map to strongly typed model
        foreach (var kvp in nvc.AllKeys) {
            var pi = request.GetType().GetProperty(kvp, BindingFlags.Public | BindingFlags.Instance);
            int i;
            if (int.TryParse(nvc[kvp], out i)) {
                if (pi != null) pi.SetValue(request, i, null);
            } else {
                if (pi != null) pi.SetValue(request, nvc[kvp], null);
            }
        }
        request.SourceFile = HttpContext.Current.Request.Files["SourceFile"];
        var repoPath = RepositoryHelper.UploadImagePath();
        if (request.SourceFile != null)
            repoPath += request.SourceFile.FileName;
        var album = new AlbumInfo {
            AlbumDescription = request.Description,
            AlbumName = request.Name,
            AlbumType = request.AlbumType,
            AlbumImagePath = repoPath,
            StatusId = 1,
            IsActive = true,
            UploadedBy = User.ID,
        };
        var albumId = AlbumController.Save(album);
        LogHelper.Log(Logger.Application, LogLevel.Info, "UploadAlbum - album created");
        if (request.SourceFile != null) {
            request.SourceFile.SaveAs(repoPath);
            //Generate the thumnail
            ImageThumbnailGenerator.ResizeToFixedSize(repoPath, albumId);
            LogHelper.Log(Logger.Application, LogLevel.Info, "UploadAlbum - Cover image got generated");

        }

        context.Response.ContentType = "text/json";
        context.Response.Write("Album got created Successfully!");
        LogHelper.Log(Logger.Application, LogLevel.Info, "UploadAlbum - End");
    }

    public bool IsReusable {
        get { return false; }
    }

}

public class AlbumDto {
    public string Name { get; set; }
    public string Description { get; set; }
    public int AlbumType { get; set; }
    public HttpPostedFile SourceFile { get; set; }
}