﻿using System;
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
    public class BasketsController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        // GET: Baskets
        public ActionResult Index()
        {
            string sessionKey = HttpContext.Session.SessionID;
            var getCustomerID = (from x in db.Anonym
                        where x.SessionID == sessionKey
                        select x.ID).FirstOrDefault();

            var query = from x in db.Basket
                        where x.CustomerID == getCustomerID
                        select x;

            return View(query.ToList());
        }

        // GET: Baskets/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Basket basket = db.Basket.Find(id);
            if (basket == null)
            {
                return HttpNotFound();
            }
            return View(basket);
        }

        //Quanitity plus minus
        public ActionResult ModifyQuantity(int? id, int deltaQuantity)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Basket basket = db.Basket.Find(id);
            if (basket == null)
            {
                return HttpNotFound();
            }
            if (basket.Quantity <= 1 && deltaQuantity == -1)
            {
                db.Basket.Remove(basket);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                basket.Quantity += deltaQuantity;
                db.SaveChanges();
                return RedirectToAction("Index", db.Basket.ToList());
            }
        }

        // GET: Baskets/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Basket basket = db.Basket.Find(id);
            if (basket == null)
            {
                return HttpNotFound();
            }
            return View(basket);
        }

        // POST: Baskets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Basket basket = db.Basket.Find(id);
            db.Basket.Remove(basket);
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
