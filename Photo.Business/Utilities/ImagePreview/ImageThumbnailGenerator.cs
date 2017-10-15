using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ImageMagick;
using Photo.Business.Entities.Model;
using Photo.Business.Utilities.Storage;

namespace Photo.Business.Utilities.ImagePreview {
    public class ImageThumbnailGenerator {
        public static void ResizeToFixedSize(ThumbnailTypeType type, string imagePath, long fileId, int width = 250,
            int height = 250) {

            // Read from file
            using (var image = new MagickImage(imagePath)) {
                // Resize the image to fit inside the specified size.
                if (image.Width > width || image.Height > height)
                    image.Resize(width, height);

                // Extent the image to the specified size.
                image.Extent(width, height, Gravity.Center, MagickColors.Transparent);

                var baseBath = RepositoryHelper.GetThumbnailFilePath(DocumentType.WorkFileUpload, type);
                baseBath += fileId + "_" + width + "x" + height + ".png";
                // Save the result
                image.Write(baseBath);
            }
        }
    }
}
