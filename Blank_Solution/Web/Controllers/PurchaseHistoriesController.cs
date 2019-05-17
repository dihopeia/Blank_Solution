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
    public class PurchaseHistoriesController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        // GET: PurchaseHistories
        public ActionResult Index()
        {
            return View(db.PurchaseHistory.ToList());
        }

        // GET: PurchaseHistories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseHistory purchaseHistory = db.PurchaseHistory.Find(id);
            if (purchaseHistory == null)
            {
                return HttpNotFound();
            }
            return View(purchaseHistory);
        }

        // GET: PurchaseHistories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PurchaseHistories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerID,FirstName,LastName,EmailAddress,PhoneNumber,City,ZipCode,Address,ProductID,Count,Price,Status,PurchaseTime")] PurchaseHistory purchaseHistory)
        {
            if (ModelState.IsValid)
            {
                db.PurchaseHistory.Add(purchaseHistory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(purchaseHistory);
        }

        // GET: PurchaseHistories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseHistory purchaseHistory = db.PurchaseHistory.Find(id);
            if (purchaseHistory == null)
            {
                return HttpNotFound();
            }
            return View(purchaseHistory);
        }

        // POST: PurchaseHistories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,FirstName,LastName,EmailAddress,PhoneNumber,City,ZipCode,Address,ProductID,Count,Price,Status,PurchaseTime")] PurchaseHistory purchaseHistory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(purchaseHistory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(purchaseHistory);
        }

        // GET: PurchaseHistories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PurchaseHistory purchaseHistory = db.PurchaseHistory.Find(id);
            if (purchaseHistory == null)
            {
                return HttpNotFound();
            }
            return View(purchaseHistory);
        }

        // POST: PurchaseHistories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PurchaseHistory purchaseHistory = db.PurchaseHistory.Find(id);
            db.PurchaseHistory.Remove(purchaseHistory);
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
