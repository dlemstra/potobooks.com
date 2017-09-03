using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Photo.Business.DataProvider;
using Photo.Business.Entities.Model;
using Photo.Business.Entities.Security;

namespace Photo.Business.Entities.Album {
    public class AlbumPhotosController {

        #region upload new photos

        /// <summary>
        /// Saves the object in the database by either inserting it if it was a newly created object or updating it if it has an exisiting record
        /// </summary>
        /// <param name="album"></param>
        public static long Save(AlbumImageInfo album) {
            var transaction = DataProviderManager.Provider.NewDataTransaction;
            var connection = transaction.Connection;

            try {
                var albumId = DataProviderManager.Provider.SaveAlbumImage(album, transaction);
                transaction.Commit();
                return albumId;
            } catch (Exception ex) {
                transaction.Rollback();
                throw;
            } finally {
                connection.Close();
            }
        }

        public static IEnumerable<AlbumImageInfo> GetAllAlbumPhotos(long albumId) {
            return DataProviderManager.Provider.GetAllAlbumImages(albumId);
        }

        #endregion
    }
}
