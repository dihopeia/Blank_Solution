namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ProductBevezetese : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        ID = c.Guid(nullable: false),
                        Name = c.String(),
                        UrlFriendlyName = c.String(),
                        Price = c.Int(nullable: false),
                        Description = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Products");
        }
    }
}
