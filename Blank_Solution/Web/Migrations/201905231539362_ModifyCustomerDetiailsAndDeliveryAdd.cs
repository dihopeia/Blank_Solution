namespace Web.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModifyCustomerDetiailsAndDeliveryAdd : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CustomerDetails", "CustomerID", c => c.Int(nullable: false));
            AddColumn("dbo.DeliveryAddresses", "CustomerID", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.DeliveryAddresses", "CustomerID");
            DropColumn("dbo.CustomerDetails", "CustomerID");
        }
    }
}
