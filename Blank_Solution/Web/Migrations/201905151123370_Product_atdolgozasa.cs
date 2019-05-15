namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Product_atdolgozasa : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Brand", c => c.Int(nullable: false));
            AddColumn("dbo.Products", "Resolution", c => c.String());
            AddColumn("dbo.Products", "Hz", c => c.String());
            AddColumn("dbo.Products", "Ration", c => c.String());
            DropColumn("dbo.Products", "UrlFriendlyName");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Products", "UrlFriendlyName", c => c.String());
            DropColumn("dbo.Products", "Ration");
            DropColumn("dbo.Products", "Hz");
            DropColumn("dbo.Products", "Resolution");
            DropColumn("dbo.Products", "Brand");
        }
    }
}
