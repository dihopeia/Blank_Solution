namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddTables : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Baskets",
                c => new
                    {
                        ItemId = c.Int(nullable: false, identity: true),
                        CustomerID = c.Int(nullable: false),
                        Quantity = c.Int(nullable: false),
                        DateCreated = c.DateTime(nullable: false),
                        Products_ID = c.Int(),
                    })
                .PrimaryKey(t => t.ItemId)
                .ForeignKey("dbo.Products", t => t.Products_ID)
                .Index(t => t.Products_ID);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Price = c.Int(nullable: false),
                        Description = c.String(),
                        Brand = c.String(),
                        Size = c.String(),
                        Name = c.String(),
                        Resolution = c.String(),
                        Ratio = c.String(),
                        Hz = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.CustomerDetails",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false),
                        LastName = c.String(nullable: false),
                        EmailAddress = c.String(nullable: false),
                        PhoneNumber = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.DeliveryAddresses",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        City = c.String(nullable: false),
                        ZipCode = c.String(nullable: false),
                        Address = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.OrderLists",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Status = c.String(),
                        Basket_ItemId = c.Int(),
                        CustomerDetails_ID = c.Int(),
                        DeliveryAddress_ID = c.Int(),
                    })
                .PrimaryKey(t => t.ID)
                .ForeignKey("dbo.Baskets", t => t.Basket_ItemId)
                .ForeignKey("dbo.CustomerDetails", t => t.CustomerDetails_ID)
                .ForeignKey("dbo.DeliveryAddresses", t => t.DeliveryAddress_ID)
                .Index(t => t.Basket_ItemId)
                .Index(t => t.CustomerDetails_ID)
                .Index(t => t.DeliveryAddress_ID);
            
            CreateTable(
                "dbo.PurchaseHistories",
                c => new
                    {
                        CustomerID = c.Int(nullable: false, identity: true),
                        OrderList_ID = c.Int(),
                    })
                .PrimaryKey(t => t.CustomerID)
                .ForeignKey("dbo.OrderLists", t => t.OrderList_ID)
                .Index(t => t.OrderList_ID);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PurchaseHistories", "OrderList_ID", "dbo.OrderLists");
            DropForeignKey("dbo.OrderLists", "DeliveryAddress_ID", "dbo.DeliveryAddresses");
            DropForeignKey("dbo.OrderLists", "CustomerDetails_ID", "dbo.CustomerDetails");
            DropForeignKey("dbo.OrderLists", "Basket_ItemId", "dbo.Baskets");
            DropForeignKey("dbo.Baskets", "Products_ID", "dbo.Products");
            DropIndex("dbo.PurchaseHistories", new[] { "OrderList_ID" });
            DropIndex("dbo.OrderLists", new[] { "DeliveryAddress_ID" });
            DropIndex("dbo.OrderLists", new[] { "CustomerDetails_ID" });
            DropIndex("dbo.OrderLists", new[] { "Basket_ItemId" });
            DropIndex("dbo.Baskets", new[] { "Products_ID" });
            DropTable("dbo.PurchaseHistories");
            DropTable("dbo.OrderLists");
            DropTable("dbo.DeliveryAddresses");
            DropTable("dbo.CustomerDetails");
            DropTable("dbo.Products");
            DropTable("dbo.Baskets");
        }
    }
}
