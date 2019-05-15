namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ProductTabla4 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Products", "Size", c => c.String());
            AddColumn("dbo.Products", "Ratio", c => c.String());
            DropColumn("dbo.Products", "Ration");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Products", "Ration", c => c.String());
            DropColumn("dbo.Products", "Ratio");
            DropColumn("dbo.Products", "Size");
        }
    }
}
