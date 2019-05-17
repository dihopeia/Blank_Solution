namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PurchaseHistory : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.PurchaseHistories",
                c => new
                    {
                        CustomerID = c.Int(nullable: false, identity: true),
                        FirstName = c.String(),
                        LastName = c.String(),
                        EmailAddress = c.String(),
                        PhoneNumber = c.String(),
                        City = c.String(),
                        ZipCode = c.String(),
                        Address = c.String(),
                        ProductID = c.Int(nullable: false),
                        Count = c.Int(nullable: false),
                        Price = c.Int(nullable: false),
                        Status = c.String(),
                        PurchaseTime = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.CustomerID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.PurchaseHistories");
        }
    }
}
