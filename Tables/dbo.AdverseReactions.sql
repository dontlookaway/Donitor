CREATE TABLE [dbo].[AdverseReactions]
(
[ReactionID] [bigint] NOT NULL IDENTITY(1, 1),
[CollectionID] [bigint] NOT NULL,
[DAECode] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdverseReactions] ADD CONSTRAINT [PK__AdverseR__46DDF9D4FFC5091E] PRIMARY KEY CLUSTERED  ([ReactionID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdverseReactions] ADD CONSTRAINT [FK__AdverseRe__Colle__29572725] FOREIGN KEY ([CollectionID]) REFERENCES [dbo].[PlasmaCollection] ([CollectionID])
GO
ALTER TABLE [dbo].[AdverseReactions] ADD CONSTRAINT [FK__AdverseRe__DAECo__2A4B4B5E] FOREIGN KEY ([DAECode]) REFERENCES [lookups].[DAE] ([DAECode])
GO
