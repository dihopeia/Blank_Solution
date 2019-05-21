namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AnonymTable : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Anonyms",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        SessionID = c.String(),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Anonyms");
        }
    }
}
