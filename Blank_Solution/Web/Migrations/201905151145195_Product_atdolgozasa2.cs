namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Product_atdolgozasa2 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Products", "Brand", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Products", "Brand", c => c.Int(nullable: false));
        }
    }
}
