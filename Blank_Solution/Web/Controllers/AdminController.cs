using System;
using System.Web.SessionState;
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
    public class AdminController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();
        private ApplicationDbContext data = new ApplicationDbContext();
        //[Authorize(Roles = "Admin")] Uncommenteld ki ha van admin felhasználód (nem enged használni ha nem vagy az)
        public ActionResult Index()
        {
            ViewBag.Products = db.Product.ToList();
            ViewBag.OrderList = db.OrderList.ToList();
            ViewBag.CustomerDetail = db.CustomerDetail.ToList();
            return View(db.Product.ToList());
        }

        // GET: Products/Edit/5
        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Product.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AdminEdit([Bind(Include = "ID,Price,Description,Brand,Size,Name,Resolution,Ratio,Hz")] Products products)
        {
            if (ModelState.IsValid)
            {
                db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("AdminProducts");
            }
            return View(products);
        }

        // GET: Products/AdminDelete/5
        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Product.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Products/AdminDelete/5
        [HttpPost, ActionName("AdminDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.Product.Find(id);
            db.Product.Remove(products);
            db.SaveChanges();
            return RedirectToAction("AdminProducts");
        }

        // POST: Admin/AdminUsers/5
        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult UserDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int getCustomerID = 0;
            string sessionKey = HttpContext.Session.SessionID;
            string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

            string isUsernNameExist = (from une in data.Users
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
            var query = from x in data.Users
                        join c in db.Anonym on x.Email equals c.SessionID
                        where x.Email == c.SessionID
                        select x;

            data.Users.Remove(query.FirstOrDefault());
            db.SaveChanges();
            return RedirectToAction("AdminUsers");
        }

        /* POST: AdminUsers/UserDelete/5
        [HttpPost, ActionName("UserDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult UserConfirmed(int id)
        {
            CustomerDetails customerDetails = db.CustomerDetail.Find(id);
            db.CustomerDetail.Remove(customerDetails);
            db.SaveChanges();
            return RedirectToAction("AdminUsers");
        }*/

        //GET: Products/AdminDelete/5
        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult OrderDelivered(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderList orderList = db.OrderList.Find(id);
            if (orderList == null)
            {
                return HttpNotFound();
            }
            return View(orderList);
        }

        //POST: Admin/AdminOrders/5
        [HttpPost, ActionName("OrderDelivered")]
        [ValidateAntiForgeryToken]
        public ActionResult OrderDeliveredConfirmed(int id)
        {
            OrderList orderList = db.OrderList.Find(id);
            if (orderList.Status == "Deleted")
            {
                return RedirectToAction("AdminOrders");
            }
            orderList.Status = "Delivered";
            db.SaveChanges();
            return RedirectToAction("AdminOrders");
        }

        //GET: Products/AdminDelete/5
        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult OrderDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderList orderList = db.OrderList.Find(id);
            if (orderList == null)
            {
                return HttpNotFound();
            }
            return View(orderList);
        }
        
        //POST: Admin/AdminOrders/5
        [HttpPost, ActionName("OrderDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult OrderDeleteConfirmed(int id)
        {
            OrderList orderList = db.OrderList.Find(id);
            if (orderList.Status == "Delivered")
            {
                return RedirectToAction("AdminOrders");
            }
            orderList.Status = "Deleted";
            db.SaveChanges();
            return RedirectToAction("AdminOrders");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        // GET: Products/Create
        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminCreate()
        {
            return View();
        }

        // POST: Products/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AdminCreate([Bind(Include = "ID,Price,Description,Brand,Size,Name,Resolution,Ratio,Hz")] Products products)
        {
            if (ModelState.IsValid)
            {
                db.Product.Add(products);
                db.SaveChanges();
                return RedirectToAction("AdminProducts");
            }

            return View(products);
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Product.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminProducts()
        {
            ViewBag.Message = "AdminProducts";
            ViewBag.Products = db.Product.ToList();
            return View(db.Product.ToList());
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminUsers()
        {
            ViewBag.Message = "AdminUsers";
            ViewBag.CustomerDetail = db.CustomerDetail.ToList();
            return View(db.CustomerDetail.ToList());
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminOrders()
        {
            ViewBag.Message = "AdminOrders";
            ViewBag.OrderList = db.OrderList.ToList();
            return View(db.OrderList.ToList());
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult Messages()
        {
            ViewBag.Message = "Messages";
            //ViewBag.Messages = db.CustomerDetail.ToList();
            return View();
        }
    }
}