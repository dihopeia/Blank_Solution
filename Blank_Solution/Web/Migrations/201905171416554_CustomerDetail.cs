namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CustomerDetail : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CustomerDetails",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        FirstName = c.String(nullable: false),
                        LastName = c.String(nullable: false),
                        PhoneNumber = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.CustomerDetails");
        }
    }
}
