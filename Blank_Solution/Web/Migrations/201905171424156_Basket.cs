namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Basket : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Baskets",
                c => new
                    {
                        CustomerID = c.Int(nullable: false, identity: true),
                    })
                .PrimaryKey(t => t.CustomerID);
            
            AddColumn("dbo.Products", "Basket_CustomerID", c => c.Int());
            CreateIndex("dbo.Products", "Basket_CustomerID");
            AddForeignKey("dbo.Products", "Basket_CustomerID", "dbo.Baskets", "CustomerID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Products", "Basket_CustomerID", "dbo.Baskets");
            DropIndex("dbo.Products", new[] { "Basket_CustomerID" });
            DropColumn("dbo.Products", "Basket_CustomerID");
            DropTable("dbo.Baskets");
        }
    }
}
