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
    public class CustomerDetailsController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        // GET: CustomerDetails
        public ActionResult Index()
        {
            return View(db.CustomerDetail.ToList());
        }

        // GET: CustomerDetails/Details/5
        public ActionResult Details(int? id)
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

        // GET: CustomerDetails/Create
        public ActionResult Create()
        {
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
                db.CustomerDetail.Add(customerDetails);
                db.SaveChanges();
                return RedirectToAction("Create", "DeliveryAddresses");
            }

            return View(customerDetails);
        }

        // GET: CustomerDetails/Edit/5
        public ActionResult Edit(int? id)
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

        // POST: CustomerDetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,CustomerID,FirstName,LastName,EmailAddress,PhoneNumber")] CustomerDetails customerDetails)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customerDetails).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
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
