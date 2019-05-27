using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web.DataModel;
using Web.Models;

namespace Web.Controllers
{
    public class DeliveryAddressesController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        // GET: DeliveryAddresses
        public ActionResult Index()
        {
            return HttpNotFound();
        }

        // GET: DeliveryAddresses/Details/5
        public ActionResult Details(int? id)
        {
            int getCustomerID = 0;
            string sessionKey = HttpContext.Session.SessionID;
            string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

            string isUsernNameExist = (from une in new ApplicationDbContext().Users
                                       where une.UserName == CurrentUserIdentity
                                       select une.UserName).SingleOrDefault();

            if (CurrentUserIdentity == isUsernNameExist)
            {
                getCustomerID = (from x in db.Anonym
                                 where x.SessionID == CurrentUserIdentity
                                 select x.ID).FirstOrDefault();
            }
            else
            {
                getCustomerID = (from x in db.Anonym
                                 where x.SessionID == sessionKey
                                 select x.ID).FirstOrDefault();
            }
            var query = (from y in db.DeliveryAddress
                        where y.CustomerID == getCustomerID
                        select y.Address).FirstOrDefault();
            if (query == null)
            {
                return RedirectToAction("Create", "DeliveryAddresses");
            }
            return RedirectToAction("Edit", "DeliveryAddresses");
        }

        // GET: DeliveryAddresses/Create
        public ActionResult Create()
        {
            int getCustomerID = 0;
            string sessionKey = HttpContext.Session.SessionID;
            string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

            string isUsernNameExist = (from une in new ApplicationDbContext().Users
                                       where une.UserName == CurrentUserIdentity
                                       select une.UserName).SingleOrDefault();

            if (CurrentUserIdentity == isUsernNameExist)
            {
                getCustomerID = (from x in db.Anonym
                                 where x.SessionID == CurrentUserIdentity
                                 select x.ID).FirstOrDefault();
            }
            else
            {
                getCustomerID = (from x in db.Anonym
                                 where x.SessionID == sessionKey
                                 select x.ID).FirstOrDefault();
            }
            var query = from y in db.DeliveryAddress
                        where y.CustomerID == getCustomerID
                        select y.Address;

            if (query.FirstOrDefault() != null)
            {
                List<Basket> CurrentCustomerBaskets = new List<Basket>();
                var getBaskets = from b in db.Basket
                                 where b.CustomerID == getCustomerID && b.OrderList == null
                                 select b;
                if (getBaskets == null)
                {
                    return RedirectToAction("Index", "Products");
                }
                foreach (var item in getBaskets)
                {
                    CurrentCustomerBaskets.Add(item);
                }

                CustomerDetails getCurrentCD = (from c in db.CustomerDetail
                                                where c.CustomerID == getCustomerID
                                                select c).SingleOrDefault();
                DeliveryAddress getCurrentDA = (from d in db.DeliveryAddress
                                                where d.CustomerID == getCustomerID
                                                select d).SingleOrDefault();

                DateTime localDate = DateTime.Now;
                OrderList CreateItem = new OrderList(CurrentCustomerBaskets, getCurrentCD, getCurrentDA, DateTime.Now, "Ordered");
                db.OrderList.Add(CreateItem);
                db.SaveChanges();
                return RedirectToAction("Index", "Orderlists");
            }
            return View();
        }

        // POST: DeliveryAddresses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,CustomerID,City,ZipCode,Address")] DeliveryAddress deliveryAddress)
        {
            if (ModelState.IsValid)
            {
                int getCustomerID = 0;
                string sessionKey = HttpContext.Session.SessionID;
                string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

                string isUsernNameExist = (from une in new ApplicationDbContext().Users
                                           where une.UserName == CurrentUserIdentity
                                           select une.UserName).SingleOrDefault();

                if (CurrentUserIdentity == isUsernNameExist)
                {
                    getCustomerID = (from x in db.Anonym
                                     where x.SessionID == CurrentUserIdentity
                                     select x.ID).FirstOrDefault();
                }
                else
                {
                    getCustomerID = (from x in db.Anonym
                                     where x.SessionID == sessionKey
                                     select x.ID).FirstOrDefault();
                }
                deliveryAddress.CustomerID = getCustomerID;

                db.DeliveryAddress.Add(deliveryAddress);
                db.SaveChanges();
                
                List<Basket> CurrentCustomerBaskets = new List<Basket>();
                var getBaskets = from b in db.Basket
                                 where b.CustomerID == getCustomerID && b.OrderList == null
                                 select b;

                var Validate = from asd in db.Basket
                           where asd.CustomerID == getCustomerID && asd.OrderList == null
                           select asd.Products;
                if (Validate.FirstOrDefault() == null)
                {
                    return RedirectToAction("Index", "Products");
                }
                foreach (var item in getBaskets)
                {
                    CurrentCustomerBaskets.Add(item);
                }

                CustomerDetails getCurrentCD = (from c in db.CustomerDetail
                                                where c.CustomerID == getCustomerID
                                                select c).SingleOrDefault();
                DeliveryAddress getCurrentDA = (from d in db.DeliveryAddress
                                                where d.CustomerID == getCustomerID
                                                select d).SingleOrDefault();

                DateTime localDate = DateTime.Now;
                OrderList CreateItem = new OrderList(CurrentCustomerBaskets, getCurrentCD, getCurrentDA, DateTime.Now, "Ordered");
                db.OrderList.Add(CreateItem);
                db.SaveChanges();
                return RedirectToAction("Index", "OrderLists");
            }

            return View(deliveryAddress);
        }

        // GET: DeliveryAddresses/Edit/5
        public ActionResult Edit(int? id)
        {
            int getCustomerID = 0;
            string sessionKey = HttpContext.Session.SessionID;
            string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

            string isUsernNameExist = (from une in new ApplicationDbContext().Users
                                       where une.UserName == CurrentUserIdentity
                                       select une.UserName).SingleOrDefault();

            if (CurrentUserIdentity == isUsernNameExist)
            {
                getCustomerID = (from x in db.Anonym
                                 where x.SessionID == CurrentUserIdentity
                                 select x.ID).FirstOrDefault();
            }
            else
            {
                getCustomerID = (from x in db.Anonym
                                 where x.SessionID == sessionKey
                                 select x.ID).FirstOrDefault();
            }
            var query = from x in db.DeliveryAddress
                        where x.CustomerID == getCustomerID
                        select x.ID;
            id = query.FirstOrDefault();
            DeliveryAddress deliveryAddress = db.DeliveryAddress.Find(id);
            if (deliveryAddress == null)
            {
                return RedirectToAction("Create", "DeliveryAddresses");
            }
            return View(deliveryAddress);
        }

        // POST: DeliveryAddresses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CustomerID,City,ZipCode,Address")] DeliveryAddress deliveryAddress)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deliveryAddress).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(deliveryAddress);
        }

        // GET: DeliveryAddresses/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeliveryAddress deliveryAddress = db.DeliveryAddress.Find(id);
            if (deliveryAddress == null)
            {
                return HttpNotFound();
            }
            return View(deliveryAddress);
        }

        // POST: DeliveryAddresses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DeliveryAddress deliveryAddress = db.DeliveryAddress.Find(id);
            db.DeliveryAddress.Remove(deliveryAddress);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
