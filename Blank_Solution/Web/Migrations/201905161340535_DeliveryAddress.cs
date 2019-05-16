namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DeliveryAddress : DbMigration
    {
        public override void Up()
        {
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
            
        }
        
        public override void Down()
        {
            DropTable("dbo.DeliveryAddresses");
        }
    }
}
