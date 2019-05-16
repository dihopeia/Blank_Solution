namespace Web.DataModel
{
    using System;
    using System.Data.Entity;
    using System.Linq;
    using Web.Models;

    public class Entity_Data__Modell : DbContext
    {
        // Your context has been configured to use a 'Entity_Data__Modell' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'Web.DataModel.Entity_Data__Modell' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'Entity_Data__Modell' 
        // connection string in the application configuration file.
        public Entity_Data__Modell()
            : base("name=Entity_Data_ Modell")
        {
        }

        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        // public virtual DbSet<MyEntity> MyEntities { get; set; }
        public virtual DbSet<Products> Product { get; set; }
        public virtual DbSet<CustomerDetails> CustomerDetails { get; set; }
        public virtual DbSet<DeliveryAddress> DeliveryAddresses { get; set; }
    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}