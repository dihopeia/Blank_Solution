namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModifyTables : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.OrderLists", "DateCreated", c => c.DateTime(nullable: false));
            DropColumn("dbo.Baskets", "DateCreated");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Baskets", "DateCreated", c => c.DateTime(nullable: false));
            DropColumn("dbo.OrderLists", "DateCreated");
        }
    }
}
