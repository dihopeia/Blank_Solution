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
    public class CustomerDetailsController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        // GET: CustomerDetails
        public ActionResult Index()
        {
            return HttpNotFound();
        }

        // GET: CustomerDetails/Details/5
        public ActionResult Details(int? id)
        {
            int getCustomerID = 0;
            string sessionKey = HttpContext.Session.SessionID;
            string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

            string isUsernNameExist = (from une in new ApplicationDbContext().Users
                                       where une.UserName == CurrentUserIdentity
                                       select une.UserName).SingleOrDefault();

            string isUserNameExist = new ApplicationDbContext().Users.Where(us => us.UserName == CurrentUserIdentity).Select(un => un.UserName).SingleOrDefault();

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
            var query = from y in db.CustomerDetail
                        where y.CustomerID == getCustomerID
                        select y.ID;
            id = query.FirstOrDefault();
            if (id == null)
            {
                return RedirectToAction("Create", "CustomerDetails");
            }
            return RedirectToAction("Edit", "CustomerDetails");
        }

        // GET: CustomerDetails/Create
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
            var query = from y in db.CustomerDetail
                        where y.CustomerID == getCustomerID
                        select y.FirstName;

            if (query.FirstOrDefault()!=null)
            {
                return RedirectToAction("Create", "DeliveryAddresses");
            }
            return View();
        }

        // POST: CustomerDetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,FirstName,LastName,EmailAddress,PhoneNumber")] CustomerDetails customerDetails)
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
                customerDetails.CustomerID = getCustomerID;

                var query = (from a in db.CustomerDetail
                             where a.CustomerID == getCustomerID
                             select a.FirstName).FirstOrDefault();
                if (query != null)
                {
                    return RedirectToAction("Index", "Products");
                }
                var emptyBasket = (from b in db.Basket
                                  where b.CustomerID == getCustomerID && b.OrderList == null
                                  select b.Products).FirstOrDefault();
                if(emptyBasket!=null)
                {
                    db.CustomerDetail.Add(customerDetails);
                    db.SaveChanges();
                    return RedirectToAction("Create", "DeliveryAddresses");
                    
                }
                db.CustomerDetail.Add(customerDetails);
                db.SaveChanges();
                return RedirectToAction("Index", "Products");
            }

            return View(customerDetails);
        }

        // GET: CustomerDetails/Edit/5
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
            var query = from x in db.CustomerDetail
                        where x.CustomerID == getCustomerID
                        select x.ID;
            id = query.FirstOrDefault();
                CustomerDetails customerDetails = db.CustomerDetail.Find(id);
                if (customerDetails == null)
                {
                    return RedirectToAction("Create", "CustomerDetails");
                }
                return View(customerDetails);
        }

        // POST: CustomerDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CustomerID,FirstName,LastName,EmailAddress,PhoneNumber")] CustomerDetails customerDetails)
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
                customerDetails.CustomerID = getCustomerID;
                db.Entry(customerDetails).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            return View(customerDetails);
        }

        // GET: CustomerDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CustomerDetails customerDetails = db.CustomerDetail.Find(id);
            if (customerDetails == null)
            {
                return HttpNotFound();
            }
            return View(customerDetails);
        }

        // POST: CustomerDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CustomerDetails customerDetails = db.CustomerDetail.Find(id);
            db.CustomerDetail.Remove(customerDetails);
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
