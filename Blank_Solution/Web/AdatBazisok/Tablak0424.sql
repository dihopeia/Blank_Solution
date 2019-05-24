USE [Web.DataModel.Entity_Data__Modell]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anonyms]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anonyms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Anonyms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Products_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Baskets] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[EmailAddress] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.CustomerDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryAddresses]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryAddresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[ZipCode] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.DeliveryAddresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLists]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[BasketList_ItemId] [int] NULL,
	[CustomerDetails_ID] [int] NULL,
	[DeliveryAddress_ID] [int] NULL,
 CONSTRAINT [PK_dbo.OrderLists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Resolution] [nvarchar](max) NULL,
	[Ratio] [nvarchar](max) NULL,
	[Hz] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseHistories]    Script Date: 2019. 05. 24. 20:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseHistories](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[OrderList_ID] [int] NULL,
 CONSTRAINT [PK_dbo.PurchaseHistories] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201905241706450_Everything', N'Web.Migrations.Configuration', 0x1F8B0800000000000400ED5D596FE4B8117E0F90FF20E82909BC2DDBF3B26B74EFC2D31E671B3B3EE2F66C16FB62D012DD1656A23A3A0CF706F96579C84FCA5F0875F314491DED9EC0186030CDE363B1AA582C92559AFFFEFB3FF31F5EC3C07A8171E24768619FCC8E6D0B2237F27CB459D859FAF4CDB7F60FDFFFF10FF34F5EF86AFD5CB7FB90B7C33D51B2B09FD3747BE63889FB0C4390CC42DF8DA3247A4A676E143AC08B9CD3E3E3EF9C93130762081B6359D6FC2E43A91FC2E207FEB98C900BB7690682ABC883415295E39A75816A5D8310265BE0C285FD77F838BB0029285ADAD679E0034CC41A064FB605108A52906212CFBE24709DC611DAACB7B80004F7BB2DC4ED9E4090C08AF4B3B6B9EE2C8E4FF359386DC71ACACD92340A0D014F3E546C71D8EEBD986B376CC38CFB84199CEEF25917CC5BD8E72842BBD0B6D8A1CE96419C372B395BF27F56363EB270D1512375AC1CF99F236B99056916C30582591A83E0C8BACD1E03DFFD09EEEEA3DF205AA02C0848623039B88E2AC045B771B48571BABB834F1589AB0BDB72E87E0EDBB1E946F429C95FA1F4C3A96D5DE3C1C163001B5913535DA7510CFF0A118C410ABD5B90A630C6A25A79B0E016373A33D61A263923DA21B186E175625B57E0F533449BF47961E37FDAD6A5FF0ABDBAA422E30BF2F1B2C29DD23883F44873A79556A70C3F82E437986ACAB06CBC7719A6305C793DE458F5DB972C97050B61ACD69F6E9CBF65A01ACF08E51ABCF89B62220C1EFEE9656E9AD8D61D0C8A06C9B3BF2D0D5C25D287B6CD651C857751D0A84653F5B08EB2D8C5E3DE47E2FA7B106F7255EAA5872D015A9A58377FB727ACACFD424403D4EF02266EEC6FCB3D6354A3C48FF53106C89B7C94B5FF3B9C7C90FCEFC907B9834914647B11CD5DAE8F938FF2E3EF6FB5F1D5D6FA02A6C00F74ED0ED3EBDDFC4CB3055EFA71928EB4A20C87FE0CDE6AE44F2156A973CF8BB14FB8FFD16F9F2304AFB3F011C6530FAEBD462F60E0E383E4AE618AD61A657ABDAFD169D6E8927051F7A7A6BFFADB25EEBDFF81F7B430B5D7C64DECC1F8B39FE89EDD9AF6EFEB81F17771AF650CF3BEF5A079D1BD1F9A2BC91A93948DA123BA67BBF20C56AA81E074D708FD816CD81EF144F5DC394FD84874D8EB229473B73AA9E55A8B48661A75D0CDB634259EDB873A89E75A8B88671A7510CFB61C76CCC6A33C8304FE8891A378A77BDAA67BEDDB82903B96A925D1DFED065814A9E210465AA0320C5B1F88D6ADCA481B712A236F69A232E74912B97E412A6563DA2B227AEE9F906729EE8B4A63D8DE36618B8835C5DF62DDC0042CECBF700C9583D6532140DBAB231AF678363B61E74CCCAE7BD242CB2923B2DB8CB6941202D6E740A7F955F2762426B006594DACD43A8FC60E99552746E0F6914998C31A7C35E952EB3F1A7364BB063102B74F8DC81CB9699391AE61E78825CF6E63FA2C525B491D211830A734B3CB086115C43B4A7DD82F4A1FF267C78787629B0D049BF1970456FB71527986ECB47294354C9917B9D6B45713A92B38B6D0FD6B1BC2F5AF2B14FD2B532C00688DB402825EB202246E4D2B003935E710B9160A44422B382CA24EC52B5687799EB12D184442E15811120F3A442BC99B0FEB81A9B7F4662EADCA38FA28F54223501AC561FD3B7A8E1AF3171F797826A83778FD2D9E988854FEFA7BBA92B983B8C22D9F2ED6746EFB861BFF0026C9767A0292351B23728C330F5D1CEBF4050CBD81011C936DFF04A4CAEA99B3ACE33CC3B34CD34330F4114893D26D3D0D9D021D5974B0AC3E6D356E401B8FE494014975E09223895C9A5F81EDD6471B2292A92AB1D66518D3F29BB579904F5862386E2288F569A86D46C2DC011BC8D4E2A131A5C59B4DEECF3C82FC38BDF442AE99C8E9916C92F588945FC30BB0DE31EBE6F9BFCB2E5450D74C0CD0F2F0124F2BC4A7FB62869010B6AC6311480602100B6E2E975190854876FBD9D59B0807224188621E6BEE307360B9E4706C62B49665BA9648AAADA9BF48C4001A229175948AA48A03A2C4228C29EA42212F924824F9E554175A1BE34362B5A50723E6DA31EB2F67999BA9216979D769965F153D43025445FA1854F80C894455E8E35521322452556460568A0018CAA21425FA08E58B38895096E82390A12B240E596E805646A7504065913E461E7B4202E4BF0F66DD31FE6CFFE5A770E13556A112619AC538AEC125224A4830A2581FAB0D1121A1DA527D243AE48344A36B0C4C1819C6411932B2E260D45C7D5CD2D5730592869E2B11BE063D5F724EC552E250C8109A080B12A429D4C711AA758746BF9106769D3B75754F8AA1A1751D7DA7D1372ADE817250C80A03E7A28A79A0DC8BAAEC60A4CC5E060C7067BB9174BC5A15C2B896626A8ED3771EA243227119DD7D18241AEA1DFAF22B1C61440C77D9CCB3456B69353022DEE69C698637A7ACBAB3D2A5CCE014DB49D832429E5F3CD5AD923C08A20980D09C377BCB65AC14E21B7AA56DA55A6B5B51811CBA2EDF07088300EB25174D420DB54663AB18AE2DCAA98FA833DCFB855A71B82EE3688FE455A2A76458B4110C8EF24DE6A09448CD8011B5887BFC506B11D7651C2D92BCD4F4140D8B36AA1649DEA90E4A8BD40C18AC451DCF5C9A4E23D9C5D03B140848F978D553402DCE085AA47CBAD324B28F0F3C5CABBA58A1D627EEF18F6DD2B8E8CD2320F3D837AF1EDED4DF32E05EE2CA26B685E7FFE27BF92BDC7A97E04DBAD0CED9FA1FC132F0F1A1A06D700590FF0493B48CD9B54F8F4F4E996F221CCEF7099C24F1A8CB51E9470A6891ED2171C147F5E2EE0A2436CD2F603F17805E40BEAEE23F85E0F5CF24DCF04F02F4E1D82899FA93708E8F032F8619989ADF07833A5A11305CF0DF0A79F07561FFB3E87766AD7E7920BA1E59854D3AB38EAD7F8D24774980F7D7BA56A854F83E821224C21B2C371E8F4A761F844426B40F022ADF2B4600E213D387C191C9E78390DA04F3294C657758FCD7BA72C6B1955C0EB75400BDF2B287A18972AD87210AF2A74D007BE744BFAB9C38257998349934E3616003F4AC473AF0FF874208B2723DFC231D9E953B6C0FE76F3ACD5C380E40DF9193AF1AF2CACC8C1C1E61083DA2CB17337A7884291CDDAE2B96B748499D6405D17716666220FB0E1740FF9452FAE1D038DF93C2AA73297AA4A362B9C33817030896114AD218F8FC332A3E6F20D7DF8280A59DBFD9D2B1C0393B1B48B6E6026E21CA15839E9BCE488A17CD0699516A150BA64AADD5969A42FACC25AD7992652F1D30908BFCCD505B0BBAC250F801B5DE2BF7AA0EBA49C6C227C0BE19BF07A025EA10CDD10D8699AAE8BD4DEE55577473AE850F7D7D13A00F4057D4618E6FAC2B7A2F907BD015F3147443892AF483CB3F1B92BFDE4B57CC0437504BD47171FC90AA17C6D1B5449C8BCF67AFB13235CCB22FDFDCF089F531BFC42CDDE5B24E9D5CAE4CC1178197756AF0D675EE48D0170D70DB2F7D5F34101F8D23186F0F49FEA261994670B46F0188066BAA35E466FEAD00A114A946BE607AD37F528055413AD14BFD1981A9F3E347FD6A8036C9B27D6860DAB17ABA137D0E40620684F94487C28A89F2FC25A64927077FCFAC983C7FDF700ADDEE947EAAFF3879F97C080E764488FF74047B4489BF6921F2C822045DCA0569DAACD05354FB430C457513E63AEF0AAF160FFB27E771EA3F0137C5D56E1E0D927F60F2671064307FD47A84DE0ADD64E9364BF19461F81850CCC83DAAAEF18B8F0FD034CF6F8A07F0648C296032FDFC12FF067DCCFCC06BE8BE14BC7B48207257ADBA23CD6599E677A59B5D83741D214DA08A7D8D87790FC36D80C1921BB4062FB00F6D5F12F8196E80BBAB23A9E4206A41D06C9F5FF860138330A930DAFEF827D6612F7CFDFE7FEBC48CDE7B670000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Anonyms] ON 
GO
INSERT [dbo].[Anonyms] ([ID], [SessionID]) VALUES (1, N'lgm2xbcetobyarfblne0a5xa')
GO
SET IDENTITY_INSERT [dbo].[Anonyms] OFF
GO
SET IDENTITY_INSERT [dbo].[Baskets] ON 
GO
INSERT [dbo].[Baskets] ([ItemId], [CustomerID], [Quantity], [Products_ID]) VALUES (1, 1, 1, 3)
GO
INSERT [dbo].[Baskets] ([ItemId], [CustomerID], [Quantity], [Products_ID]) VALUES (2, 1, 1, 4)
GO
INSERT [dbo].[Baskets] ([ItemId], [CustomerID], [Quantity], [Products_ID]) VALUES (3, 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Baskets] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerDetails] ON 
GO
INSERT [dbo].[CustomerDetails] ([ID], [CustomerID], [FirstName], [LastName], [EmailAddress], [PhoneNumber]) VALUES (1, 1, N'Mcleod', N'Sanyi', N'mcsanyi@nani.com', N'0690')
GO
SET IDENTITY_INSERT [dbo].[CustomerDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryAddresses] ON 
GO
INSERT [dbo].[DeliveryAddresses] ([ID], [CustomerID], [City], [ZipCode], [Address]) VALUES (1, 1, N'A Hegy', N'2332', N'Csúcs')
GO
SET IDENTITY_INSERT [dbo].[DeliveryAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLists] ON 
GO
INSERT [dbo].[OrderLists] ([ID], [DateCreated], [Status], [BasketList_ItemId], [CustomerDetails_ID], [DeliveryAddress_ID]) VALUES (1, CAST(N'2019-05-24T19:09:32.857' AS DateTime), N'Ordered', 3, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderLists] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (3, 229, N'In competitive gaming, every frame matters. Introducing Acer''s KG241Q gaming monitor - the Full HD resolution monitor that can keep up with your game play. Through AMD Radeon FreeSync technology, the game’s frame rate is determined by your graphics card, not the fixed refresh rate of the monitor, giving you a serious competitive edge. Plus, users can enjoy comfortable viewing experience while gaming via flicker-less, low dimming and ComfyView display. The design saves space on your desk and lets you place multiple monitors side by side to build a seamless big-screen display. (UM.UX1AA.P01)', N'Acer', N'24 "', N'KG241PBMIDPX', N'1920x1080', N'16:9', N'144 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (4, 159, N'Find the perfect fit for your viewing needs with this rugged yet flexible design. Get the most out of your viewing experience with high-resolution colours and innovative eye-friendly technology. The Zero-Frame design with a slim frame provides a larger viewing area. Relax in perfect perspective with the adjustable tilt function and improved stability. Set the tone - with voluminous sound from the built-in dual speaker system.', N'Acer', N'21.5 "', N'V227QBIP', N'1920x1080', N'16:9', N'75 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (5, 309, NULL, N'Acer', N'27 "', N'ED276UBIIPX', N'2560x1440', N'16:9', N'75 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (6, 219, N'ASUS VZ249HE-W has a space-saving design with an ultra-slim profile that measures a mere 7mm at its thinnest point. Its frameless design makes it perfect for almost-seamless multi-display setups that give you an even greater degree of immersion. An advanced high-performance IPS panel gives you an astonishing 80,000,000:1 contrast ratio and wide 178 viewing angles. In addition, ASUS Eye Care technology ensures a comfortable viewing experience. VZ249HE-W takes up very little desktop space and fits well in any setting, its ultra-slim profile measures just 7mm at its thinnest point. Whether you''re playing games, watching a movie, or getting some work done, VZ249HE-W''s frameless design means two or three monitor setups are virtually seamless, giving you a panoramic display for an even greater degree of immersion. The TV Rheinland-certified ASUS Blue Light Filter protects you from harmful blue light, and you can easily access its four different filter settings via a hotkey. VZ249HE-W has undergone stringent performance tests and has been certified by TV Rheinland laboratories, a global provider of technical, safety, and certification services, to be flicker-free and to emit low blue light levels. It''s time to say goodbye to those tired, strained eyes. VZ249HE-W features TV Rheinland-certified ASUS Flicker-Free technology to reduce flicker for a comfortable viewing experience. This technology helps minimize instances of eyestrain and other damaging ailments, especially when you spend long, countless hours in front of a display watching favorite videos.', N'Asus', N'24 "', N'VZ249HE-W', N'1920x1080', N'16:9', N'75 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (7, 149, N'When it comes to design, ASUS always have customers in mind – the ASUS VP247QG features the ASUS exclusive GamePlus hotkey with crosshair, timer, FPS counter and display alignment functions to give you in-game enhancements that help you get more out of your game. These tools allow gamers to practice and improve on their gaming skills. This function is co-developed with input from pro gamers, allowing them to practice and improve their gaming skills.', N'Asus', N'24 "', N'VP248QG', N'1920x1080', N'16:9', N'75 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (8, 129, N'Delicate touches make a monitor truly great, VS247HR Full HD LED monitor, with 50,000,000:1 high contrast ratio and HDMI interface, is optimized for the finest image and colour quality. This approach extends to the sturdy stand and slim profile without compromising style in ensuring stability and durability. 50,000,000:1 ASUS Smart Contrast Ratio Dynamically enhances the display''s contrast by adjusting the luminance of the backlight to achieve the darkest black and brightest white - delivering lifelike images. Enter a spectacular world of colours with Full HD 1080p (1920x1080) support and HDMI port. Quick response time of 2ms (GTG) eliminates ghosting and tracers for more fluid video playback. Aspect Control function allows users to select a preferred display mode among Full and 4:3 for true-to-life gaming or movie watching without any data loss or image distortion. The exclusive Splendid Video Intelligence Technology optimizes video performance and image fidelity by enhancing colour, brightness, contrast, and sharpness. 6 preset video modes (Scenery, Theatre, Game, Night View, sRGB and Standard) can be selected via a hotkey.', N'Asus', N'23,6 "', N'VS247HR', N'1920x1080', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (9, 229, N'Play games with optimized settings.  Game mode includes three sub-modes - FPS,RTS,and custom - for personalizing your gaming experience or optimizing your favorite game genres. Clearer,smoother image  Gamers can experience seamless,fluid movement during high-resolution,fast-paced games.  Versatile elegance  The curved base is an elegant style statement that also enhances stability for dependable performance. The base can be adjusted to change the tilt and angle of the monitor for a more comfortable viewing experience.', N'LG', N'29 "', N'29WK500-P.AEU', N'2560x1080', N'21:9', N'75 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (10, 84, N'This monitor gives you the freedom to take it off the desk and hang it on the wall. Liberate your viewing options and save desktop space with this wall-mountable LG monitor.', N'LG', N'20 "', N'20MK400H-B', N'1366x768', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (11, 999, N'More and more streaming videos come in 4K, you want to enjoy millions of 4K streaming videos in native 3840x2160 UHD 4K resolution. You can also review your 4K contents before uploading them. You can appreciate the amount of detail you can enhance as LG UHD 4K Monitor delivers the outcome of your work.', N'LG', N'32 "', N'32UD99-W', N'3840x2160', N'16:9', N'85 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (12, 95, N'Whether you''re catching up on the Internet or viewing documents, the BenQ GL2250 LED monitor is the perfect choice for you in style! Featuring a dynamic ratio of 12,000,000:1, Senseye Human Vision technology, 5 ms response time and DVI connector, this 21.5 16:9 LED monitor delivers every image detail with the best viewing quality.', N'Benq', N'21.5 "', N'GL2250', N'1920x1080', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (13, 719, N'Catch every detail of motion and enjoy the most fluid gameplay by ZOWIE native 240Hz refresh rate monitor, which ensures a flawless view of fast-motion and dramatic transitions consistently at all time. (Please make sure the PC performance is up to par to fully activate 240Hz) Recommended Video Card Requirement: NVIDIA GeForce GTX 980 or better AMD Radeon RX 480 or better. Shield - reveal the way to be concentrated in games. The adjustable angle and removable design allows Shield to adopt various environmen', N'Benq', N'27 "', N'ZOWIE XL2740', N'1920x1080', N'16:9', N'240 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (14, 159, N'A perfect embodiment of The Bauhaus less is more" minimalism design philosophy, the GW2406Z is a delightful complement to almost any modern space. Every aspect of its form and feature is reduced to unify simplicity and functionality into pure aesthetics. On top of it all, users get to enjoy the sheerest visual pleasure and optimal eye comfort with BenQs exclusive eye-caring technology. The GW2406Z is not only a celebration of minimalist lifestyle and modern sleekness but also the gateway to everyday enjoyment for leisure and business.', N'Benq', N'23.8 "', N'GW2406Z', N'1920x1080', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (15, 139, N'Essential and reliable performance The DellTM 17 Monitor - E1715S is your smart choice for reliability and essential features that can help drive productivity. Essential features: The E1715S offers HD quality viewing, easy connectivity and compatibility with legacy custom applications. Strong protection: Reduce downtime with the support of a Dell Limited Hardware Warranty and 3 Year Advanced Exchange. Responsible design: The E1715S minimizes power consumption with an efficient LED backlight and PowerNap technology.', N'Dell', N'17 "', N'E1715S', N'1280x1024', N'5:4', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (16, 209, N'Work conveniently across multiple screens and select from predefined templates with the Easy Arrange feature on Dell Display Manager software. Quickly tile and arrange your applications and get back to work faster with Auto-restore, a feature that remembers where you left off. A wide viewing angle enabled by In-Plane Switching (IPS) technology lets you see vibrant colorsno matter where you sit. Pivot, tilt, swivel and adjust the height of your monitor for a comfortable setup all day long. Or choose from a variety of mounts and stands, including VESA, for even more flexibility.', N'Dell', N'21.5 "', N'P2219HC', N'1920x1080', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (17, 899, N'With a feature set as impressive as its ultra-wide curved screen,Samsung''s CJ89 monitor is designed to improve performance in any workplace. So whatever your task,enjoy working smarter with Samsung.', N'Samsung', N'43 "', N'LC43J890DKUXEN', N'3840x1200', N'32:10', N'120 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (18, 369, N'Leveraging Quantum Dot technology, Samsungs radical curved gaming monitor with approximately 125% sRGB color coverage. Now the colors are more wide-ranging, richer and clearer, closer than ever to real life, making your gaming experience more like real-life action. With Samsungs OSD dashboard menu optimally tailored for gamers, you can have a full view of key game settings at a glance and use shortcut keys to change the settings the way you want them. Set this Good Design Award winner and splash straightaway into the game.', N'Samsung', N'27 "', N'LC27FG73FQUXEN', N'1920x1080', N'16:9', N'144 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (19, 169, N'The Samsung S24B300HLLED Monitor offers both more energy efficiency and viewing comfort. Magic Angle technology means you can enjoy comfortable viewing from wider range of angles, allowing you to watch TV when sitting, standing, or even lying down. This Samsung LED monitor also features Eco Saving for reduced energy costs and environmental impact. It adjusts brightness according to your needs, with three different energy-saving modes.', N'Samsung', N'24 "', N'LS24E45UFS/EN', N'1920x1080', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (20, 1099, N'Philips Brilliance 32:9 SuperWide curved LCD display 499P9H/00. Display diagonal: 124 cm (48.8"), Display resolution: 5120 x 1440 pixels, Display technology: LCD, Response time: 5 ms, Native aspect ratio: 32:9, Viewing angle, horizontal: 178°, Viewing angle, vertical: 178°. Built-in speaker(s). Built-in USB hub. VESA mounting, Height adjustment. Energy Star certified. Product colour: Black', N'Philips', N'49 "', N'499P9H/00', N'5120x1440', N'32:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (21, 259, N'Colours like you''ve never seen before. This brilliant wide-view curved Full HD display with an ultra-wide colour range offers fast action with true-to-life colours for a completely immersive experience. Desktop monitors offer a personal user experience, which suits a curved design very well. The curved screen provides a pleasant yet subtle immersion effect, which focuses on you at the centre of your desk. Ultra Wide-Color Technology delivers a wider spectrum of colours for a more brilliant picture. The Ultra Wide-Color wider colour gamut produces more natural-looking greens, vivid reds and deeper blues. Bring media entertainment, images and even productivity more alive with vivid colours from Ultra Wide-Color Technology. Philips'' VA LED display uses an advanced multi-domain vertical alignment technology that gives you super-high static contrast ratios for extra-vivid and bright images. While standard office applications are handled with ease, it is especially suitable for photos, web browsing, films, gaming and demanding graphical applications.', N'Philips', N'31.5 "', N'328E8QJAB500', N'1920x1080', N'16:9', N'60 Hz')
GO
INSERT [dbo].[Products] ([ID], [Price], [Description], [Brand], [Size], [Name], [Resolution], [Ratio], [Hz]) VALUES (22, 149, NULL, N'Philips', N'23.6 "', N'248E9QHSB/00', N'1920x1080', N'16:9', N'75 Hz')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_Products_ID]    Script Date: 2019. 05. 24. 20:04:21 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ID] ON [dbo].[Baskets]
(
	[Products_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketList_ItemId]    Script Date: 2019. 05. 24. 20:04:21 ******/
CREATE NONCLUSTERED INDEX [IX_BasketList_ItemId] ON [dbo].[OrderLists]
(
	[BasketList_ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerDetails_ID]    Script Date: 2019. 05. 24. 20:04:21 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerDetails_ID] ON [dbo].[OrderLists]
(
	[CustomerDetails_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryAddress_ID]    Script Date: 2019. 05. 24. 20:04:21 ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryAddress_ID] ON [dbo].[OrderLists]
(
	[DeliveryAddress_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderList_ID]    Script Date: 2019. 05. 24. 20:04:21 ******/
CREATE NONCLUSTERED INDEX [IX_OrderList_ID] ON [dbo].[PurchaseHistories]
(
	[OrderList_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Baskets_dbo.Products_Products_ID] FOREIGN KEY([Products_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_dbo.Baskets_dbo.Products_Products_ID]
GO
ALTER TABLE [dbo].[OrderLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderLists_dbo.Baskets_BasketList_ItemId] FOREIGN KEY([BasketList_ItemId])
REFERENCES [dbo].[Baskets] ([ItemId])
GO
ALTER TABLE [dbo].[OrderLists] CHECK CONSTRAINT [FK_dbo.OrderLists_dbo.Baskets_BasketList_ItemId]
GO
ALTER TABLE [dbo].[OrderLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderLists_dbo.CustomerDetails_CustomerDetails_ID] FOREIGN KEY([CustomerDetails_ID])
REFERENCES [dbo].[CustomerDetails] ([ID])
GO
ALTER TABLE [dbo].[OrderLists] CHECK CONSTRAINT [FK_dbo.OrderLists_dbo.CustomerDetails_CustomerDetails_ID]
GO
ALTER TABLE [dbo].[OrderLists]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderLists_dbo.DeliveryAddresses_DeliveryAddress_ID] FOREIGN KEY([DeliveryAddress_ID])
REFERENCES [dbo].[DeliveryAddresses] ([ID])
GO
ALTER TABLE [dbo].[OrderLists] CHECK CONSTRAINT [FK_dbo.OrderLists_dbo.DeliveryAddresses_DeliveryAddress_ID]
GO
ALTER TABLE [dbo].[PurchaseHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PurchaseHistories_dbo.OrderLists_OrderList_ID] FOREIGN KEY([OrderList_ID])
REFERENCES [dbo].[OrderLists] ([ID])
GO
ALTER TABLE [dbo].[PurchaseHistories] CHECK CONSTRAINT [FK_dbo.PurchaseHistories_dbo.OrderLists_OrderList_ID]
GO
USE [master]
GO
ALTER DATABASE [Web.DataModel.Entity_Data__Modell] SET  READ_WRITE 
GO
