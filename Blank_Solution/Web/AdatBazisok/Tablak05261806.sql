USE [Web.DataModel.Entity_Data__Modell]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2019. 05. 26. 18:05:43 ******/
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
/****** Object:  Table [dbo].[Anonyms]    Script Date: 2019. 05. 26. 18:05:43 ******/
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
/****** Object:  Table [dbo].[Baskets]    Script Date: 2019. 05. 26. 18:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Products_ID] [int] NULL,
	[OrderList_ID] [int] NULL,
 CONSTRAINT [PK_dbo.Baskets] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 2019. 05. 26. 18:05:43 ******/
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
/****** Object:  Table [dbo].[DeliveryAddresses]    Script Date: 2019. 05. 26. 18:05:43 ******/
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
/****** Object:  Table [dbo].[OrderLists]    Script Date: 2019. 05. 26. 18:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLists](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[CustomerDetails_ID] [int] NULL,
	[DeliveryAddress_ID] [int] NULL,
 CONSTRAINT [PK_dbo.OrderLists] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2019. 05. 26. 18:05:43 ******/
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
/****** Object:  Table [dbo].[PurchaseHistories]    Script Date: 2019. 05. 26. 18:05:43 ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201905260858404_Everything', N'Web.Migrations.Configuration', 0x1F8B0800000000000400ED5D596F24B7117E0F90FFD0E8A72490A725ED4B2CCCD8D08E56F120AB231AAD13E445A0BAA951C3DDEC491F82C6867F991FFC93FC17C2BE79937D8DC686B0C06287C7C76255B15824AB7A7FFBE5D7F9B7AF6160BDC038F123B4B04F66C7B605911B793EDA2CEC2C7DFAEAEFF6B7DFFCF94FF34F5EF86A7D5FB7FB90B7C33D51B2B09FD3747BE63889FB0C4390CC42DF8DA3247A4A676E143AC08B9CD3E3E3AF9D93130762081B6359D6FC2E43A91FC2E207FEB98C900BB7690682ABC883415295E39A75816A5D8310265BE0C285FD6FF838BB0029285ADAD679E0034CC41A064FB605108A52906212CFBE24709DC611DAACB7B80004F7BB2DC4ED9E4090C08AF4B3B6B9E92C8E4FF359386DC71ACACD92340A3B029E7CA8D8E2B0DD7B31D76ED88619F7093338DDE5B32E98B7B0CF518476A16DB1439D2D83386F5672B6E4FFAC6C7C64E1A2A346EA5839F23F47D6320BD22C860B04B33406C191759B3D06BEFB4FB8BB8F7E806881B2202089C1E4E03AAA0017DDC6D116C6E9EE0E3E5524AE2E6CCBA1FB396CC7A61BD1A7247F85D20FA7B6758D07078F016C644D4C759D4631FC0744300629F46E419AC2188B6AE5C1825BDCE8CC586B98E48C6887C41A86D7896D5D81D7CF106DD2E7858DFF695B97FE2BF4EA928A8C2FC8C7CB0A774AE30CD223CD9D565A4A197E04C90F30359461D978EF324C61B8F27AC8B1EAB72F592E0B16C258AF3F6A9C7F65A01AAF13CA3578F137C544183CFCD3CBDC34B1AD3B18140D92677F5B1AB84AA40F6D9BCB380AEFA2A0518DA6EA611D65B18BC7BD8FC4F5F720DEE4AAD44B0F5B028C34B16EFE6E4F5859FB858806A8DF054CDCD8DF967BC6A846891FEB630C9037F9286BFF4738F920F9DF930F72079328C8F6229ABB5C1F271FE5BB1FDF6AE3ABADF5054C811F98DA1DA6D7BBF999660BBCF4E3241D6945751CFA3378AB913F8558A5CE3D2FC63EE1FE47BF7D8E10BCCEC247184F3DB8F11ABD80818F0F92BB8629466B94E9F5BE46A759A34BC245DD9F9AFED7DF2E71EFFD0FBCA78569BC366E620FC69FFDC4F4ECD6B47F5F0F8CBF8B7B2D6398F7AD07CD8BEEFDB0BB92AC3149D9183A627AB62BCF60A51A084E778DD01FC886ED114F54CF9DF3848D44873D15A19CBBA5A4966B2D229969A4A09B6DD995786E1F5212CFB51611CF345210CFB61C76CCC6A33C83047E8791A378677ADAA67BEDDB82903B56574B62BEDB0DB02852C5218CB4406518B63E10AD5B959136E25446DEB28BCA9C2749E4FA05A9948D69AF88E8B97F429EA5B92F2A8D617BDB842D22D6147F8B750313B0B0FFC631540E5A4F85006DAF8E68D8E3D9EC849D33313BF5A485965346A4DA8CB6941202D691AAC71770C288BDBD98C01A643DA552EB6CC00E9542E8AD3A3102B78F4CA221ACC1D7932EB5FEA33147B66B102370FBD488CC919B3619E906768E58F2EC3666CE22BD95ECB760A5CC29CDEC32425805F18E521FF68BD287FCD9F1E1A1D86603C166FC2581D57E9C549E213BAD1C650D53E645AE35EDD544EA0A8E2D74FFDA8070FDEB0A4DFFCA140B005A23AD81A097AC00895BD31A404ECD3944AE850691D00A0E8BA8D3F18AD5619E676C0B069150385684C4830ED14AF2E6C37A60FA2DBD994BAB328E394ABDD00894467158FF8E9EA3C1FCC5471E9E09FA0DDE7C8B27262295BFF986AE65EE20AE70CB47C51AE5B6DF71E31FC024D94E4F40B26663448E71E641C531A52FD0D11B18C031D9F64F40EAAC5E779629CE333CCB0C3D848E3E026952D4D6B3A35360220B05CBEAD356E306B4F1484E199054072E3992C8A5F915D86E7DB4212299AA126B5D86312DBF5A770FF2094B0CC74D04B13E0DB5CD48983B6003995A3C34A6B478B3C9FD9947901FA7975EC83513393D924DB21E91F26B7801D63B66DD3CFF77D9850AEA9A89015A1E5EE26985F8745FCC1012C296752C02C9400062C1CDE5320AB210C96E3F55BD897020128428E6B1E60E3307964B0EC726466B59A61B89A4DA9AFA8B440C6020125947A948AA38204A2CC29822150A79914422C92FA754686D8C0F89D5961E8C986BC7ACBF9C656EA681A4E55DA7597E55F40C095015996350E133241255618E5785C89048555107B35204C05016A5283147285FC44984B2C41C810C5D2171C8F20E6865740A0554169963E4B1272440FEFB60D61DE3CFF65F7E1A17DE60156A11A6598CE31A5C22A28404238ACDB1DA101112AA2D3547A2433E4834BAA6830923C338284346561C8C9AEB8F4BA67AAE4132D0732DC2EF41CF979C53B1943814328426C28204690ACD71846AADD0E837D240D5B9D354F7A418065AA7E83B8DBE51F10E9483425674702EAA9807CABDA8CA0E46CAEC65C00077568D64E2D5EA10C6B51453739CBEF3101D1289CB68F56190686876E8CBAF70841131DC6533CF16A3A5D5C088789B73A619BE3B65D59D9529651D4EB14AC29611F2FCE2A96E95E441104D0084E1BCD95BAECE4A21BEA1D7DA56AA756FF550DDE3F7D4911672042551BD0C1CA4A6A8663FA2AA70CF167A7DE1BA186FBD4AB9481E237A2A0F8B36AA0A499E627A92DA993423FDD13360442DE2DE3CF45AC47519478B240F343D45C3A28DAA4592E7A983D2223D03066B91E275CBD05724BB74740A0502D2BE591DC276A67DB13324B28FEBFBD67B1BF7E6C736693CF3E6ED8F79E39B57EF6DFA4F18700F706513DBC2F37FF1BDFCF16DBD4BB0135068E76CFDBF6019F8F82CD036B802C87F82495A86EADAA7C727A7CCA7100EE7B3044E9278D49DA8F4DB04B4C8F690AFE0A37A71ABE287BBA615B05F09402F205F57F15F42F0FA57126EF89700FA706C9404FD4938C7877F17C30CCCC8EF83419DA808182EE66F853CF8BAB07F2AFA9D59ABFF3C105D8FACC2269D59C7D6CF6AB9F314D0D6AC1B09645F731ABA67FFFF31D62B9585DF47590439F81D963C8F47E5D90F422273E90701954F252300F139F1C3E0C8BCF741486D6EFB14E65A1D91FF7B5D39E3D86B2E7D5C2A805E29E1C3D04469DEC31005A9DB5D007BA763BFAB9C381B7A9834990CE7616003F4AC4726F21F43210409C11EFE910E4F081EB49D882ECABA39713CC210775274E5D28D1E1E610AD75275B1F216F9A793E8ECE1F8F6FDF347E957C2CEC99D14569D38D123F714CB1DC6B91840B08C5092C6C0E7DF4CB1878F5C7F0B029676FE3ECBC4E6E5EC6C20D99A0BB88528570C7A6E2623699E2F1B6446A9752C983C8F7694ACD97DEB802A0AE42D954077A1BB572D304D2416BEF7F5CDEA1DA2642329873E0C737415E9A68F660F917BD515D3BC6AE1AB5EDF24E703D0157D28E31BEB8AD973E31E74A57B9AF9B85B0C9763362447FDF0371D7DECDB01EC3EE27C7B3E438D9569C74CFAF2810D1F0D1FF3DBC2D24B2EEBF409E4DA347B117859A7076F3D664512BE6880DB7E29FAA281F8D01BC1787B48E4170DCB3482A3E5FB8B066BAA0DE4D6FD7B004229528D7CC1F4A6FF6C00AB82743297FE530153E7C04FF365801E09DBFB99EE4429FF123320CC1932CA5A1F9C65AD67C544B9FC12D3649267BF67564C9EA33F6439484CA0493AFF38B9F77CBC0D764488FF58047B4489BF6921F23022045DCA0569DAACD05354FB430C457513E616EF0AAF160FFB27E771EA3F0137C5D56E1EFA917F44F27B1064307F3D7A84DE0ADD64E9364BF19461F81850CCC83D2AD5F8C50706689AE737C54B7332C61430997E7E5B7E833E667EE035745F0A1E182410B9AB565D8DE6B24CF32BD2CDAE41BA8E902150C5BEC6C3BC87E136C060C90D5A8317D887B62F09FC0C37C0DDD561537210BD2068B6CF2F7CB089419854186D7FFC13EBB017BE7EF37F9757228F5F670000, N'6.2.0-61023')
GO
SET IDENTITY_INSERT [dbo].[Anonyms] ON 
GO
INSERT [dbo].[Anonyms] ([ID], [SessionID]) VALUES (5, N'evezjw0jtlo5okmf1buwzqit')
GO
SET IDENTITY_INSERT [dbo].[Anonyms] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerDetails] ON 
GO
INSERT [dbo].[CustomerDetails] ([ID], [CustomerID], [FirstName], [LastName], [EmailAddress], [PhoneNumber]) VALUES (5, 5, N'Mcleod', N'Sanyi', N'mcsanyi@nani.com', N'0690')
GO
SET IDENTITY_INSERT [dbo].[CustomerDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryAddresses] ON 
GO
INSERT [dbo].[DeliveryAddresses] ([ID], [CustomerID], [City], [ZipCode], [Address]) VALUES (5, 5, N'A Hegy', N'1234', N'Csúcs')
GO
SET IDENTITY_INSERT [dbo].[DeliveryAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLists] ON 
GO
INSERT [dbo].[OrderLists] ([ID], [DateCreated], [Status], [CustomerDetails_ID], [DeliveryAddress_ID]) VALUES (16, CAST(N'2019-05-26T17:42:00.207' AS DateTime), N'Ordered', 5, 5)
GO
INSERT [dbo].[OrderLists] ([ID], [DateCreated], [Status], [CustomerDetails_ID], [DeliveryAddress_ID]) VALUES (17, CAST(N'2019-05-26T17:42:37.263' AS DateTime), N'Ordered', 5, 5)
GO
INSERT [dbo].[OrderLists] ([ID], [DateCreated], [Status], [CustomerDetails_ID], [DeliveryAddress_ID]) VALUES (18, CAST(N'2019-05-26T17:59:41.393' AS DateTime), N'Ordered', 5, 5)
GO
INSERT [dbo].[OrderLists] ([ID], [DateCreated], [Status], [CustomerDetails_ID], [DeliveryAddress_ID]) VALUES (19, CAST(N'2019-05-26T18:00:18.660' AS DateTime), N'Ordered', 5, 5)
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
/****** Object:  Index [IX_OrderList_ID]    Script Date: 2019. 05. 26. 18:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_OrderList_ID] ON [dbo].[Baskets]
(
	[OrderList_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ID]    Script Date: 2019. 05. 26. 18:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ID] ON [dbo].[Baskets]
(
	[Products_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerDetails_ID]    Script Date: 2019. 05. 26. 18:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerDetails_ID] ON [dbo].[OrderLists]
(
	[CustomerDetails_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryAddress_ID]    Script Date: 2019. 05. 26. 18:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryAddress_ID] ON [dbo].[OrderLists]
(
	[DeliveryAddress_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderList_ID]    Script Date: 2019. 05. 26. 18:05:43 ******/
CREATE NONCLUSTERED INDEX [IX_OrderList_ID] ON [dbo].[PurchaseHistories]
(
	[OrderList_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Baskets_dbo.OrderLists_OrderList_ID] FOREIGN KEY([OrderList_ID])
REFERENCES [dbo].[OrderLists] ([ID])
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_dbo.Baskets_dbo.OrderLists_OrderList_ID]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Baskets_dbo.Products_Products_ID] FOREIGN KEY([Products_ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_dbo.Baskets_dbo.Products_Products_ID]
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
