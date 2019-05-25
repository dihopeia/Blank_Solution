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
        //[Authorize(Roles = "Admin")] Uncommenteld ki ha van admin felhasználód (nem enged használni ha nem vagy az)
        public ActionResult Index()
        {
            return View();
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

        // GET: Products/Delete/5
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

        // POST: Products/Delete/5
        [HttpPost, ActionName("AdminDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.Product.Find(id);
            db.Product.Remove(products);
            db.SaveChanges();
            return RedirectToAction("AdminProducts");
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

            return View(db.Product.ToList());
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminBaskets()
        {
            ViewBag.Message = "AdminBaskets";

            return View();
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminOrders()
        {
            ViewBag.Message = "AdminOrders";

            return View();
        }

        //[Authorize(Roles = "Admin")] Admin ellenőrzés
        public ActionResult AdminHistory()
        {
            ViewBag.Message = "AdminHistory";

            return View();
        }
    }
}