IF OBJECT_ID(N'__EFMigrationsHistory') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [Movie] (
    [ID] int NOT NULL IDENTITY,
    [Genre] nvarchar(max) NULL,
    [Price] decimal(18, 2) NOT NULL,
    [ReleaseDate] datetime2 NOT NULL,
    [Title] nvarchar(max) NULL,
    CONSTRAINT [PK_Movie] PRIMARY KEY ([ID])
);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20171027202649_Initial', N'2.0.0-rtm-26452');

GO

ALTER TABLE [Movie] ADD [Rating] nvarchar(max) NULL;

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20171027213129_Rating', N'2.0.0-rtm-26452');

GO

DECLARE @var0 sysname;
SELECT @var0 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'Movie') AND [c].[name] = N'Title');
IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var0 + '];');
ALTER TABLE [Movie] ALTER COLUMN [Title] nvarchar(60) NOT NULL;

GO

DECLARE @var1 sysname;
SELECT @var1 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'Movie') AND [c].[name] = N'Rating');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var1 + '];');
ALTER TABLE [Movie] ALTER COLUMN [Rating] nvarchar(5) NOT NULL;

GO

DECLARE @var2 sysname;
SELECT @var2 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'Movie') AND [c].[name] = N'Genre');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Movie] DROP CONSTRAINT [' + @var2 + '];');
ALTER TABLE [Movie] ALTER COLUMN [Genre] nvarchar(30) NOT NULL;

GO

CREATE TABLE [Review] (
    [ID] int NOT NULL IDENTITY,
    [Comment] nvarchar(max) NULL,
    [MovieID] int NOT NULL,
    [ReviewerName] nvarchar(max) NULL,
    CONSTRAINT [PK_Review] PRIMARY KEY ([ID])
);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20171109172142_Review', N'2.0.0-rtm-26452');

GO

ALTER TABLE [Review] DROP CONSTRAINT [PK_Review];

GO

DECLARE @var3 sysname;
SELECT @var3 = [d].[name]
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'Review') AND [c].[name] = N'ID');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Review] DROP CONSTRAINT [' + @var3 + '];');
ALTER TABLE [Review] DROP COLUMN [ID];

GO

ALTER TABLE [Review] ADD [ReviewID] int NOT NULL IDENTITY;

GO

ALTER TABLE [Review] ADD CONSTRAINT [PK_Review] PRIMARY KEY ([ReviewID]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20171109181138_Review_2', N'2.0.0-rtm-26452');

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20171116142038_Account', N'2.0.0-rtm-26452');

GO

