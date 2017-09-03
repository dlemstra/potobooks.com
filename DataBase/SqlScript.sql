USE [Photo2]
GO


drop table AlbumImages
GO

/****** Object:  Table [dbo].[AlbumImages]    Script Date: 9/3/2017 06:56:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AlbumImages](
	[AlbumImageId] [int] IDENTITY(1,1) NOT NULL,
	[AlbumImageName] [nvarchar](500) NULL,
	[ImageTypeId] [int] NULL,
	[AlbumImageDescription] [nvarchar](max) NULL,
	[AlbumImagePath] [nvarchar](500) NULL,
	[UploadedBy] [uniqueidentifier] NULL,
	[IsActive] [int] NULL,
	[StatusId] [int] NULL,
	[AlbumId] [int] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_AlbumImages] PRIMARY KEY CLUSTERED 
(
	[AlbumImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




/****** Object:  StoredProcedure [dbo].[AlbumImageInsert]    Script Date: 9/3/2017 06:54:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AlbumImageInsert] 
	@AlbumId bigint,
	@ImageDescription varchar(500),
	@ImageName varchar(500),
	@UploadedBy uniqueidentifier,
	@AlbumImagePath varchar(500),
	@ImageTypeId tinyint,
	@IsActive tinyint,
	@StatusId smallint,
	@IdentityReturn bigint OUTPUT
AS
BEGIN
INSERT INTO [dbo].[AlbumImages]
           ([AlbumId]
           ,[AlbumImageName]
           ,[AlbumImagePath]
           ,[AlbumImageDescription]
           ,[UploadedBy]
           ,[IsActive]
           ,[ImageTypeId],
		    [Updated]
          )
     VALUES
           (@AlbumId
           ,@ImageName
           ,@AlbumImagePath
           ,@ImageDescription
           ,@UploadedBy
           ,@IsActive
           ,@StatusId
           ,GETUTCDATE()
           )
	-- Error validation
	SET @IdentityReturn = @@IDENTITY	
END




SET ANSI_NULLS ON
