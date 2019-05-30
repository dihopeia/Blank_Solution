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
    public class ProductsController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        // GET: Products
        public ActionResult Index()
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            return View(db.Product.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Product.Find(id);
            string getImage = (from x in db.Images
                              where x.productID == id
                              select x.imgURL).FirstOrDefault();
            ViewBag.KepUrl = getImage;
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        //GET: Product/Name/byName
        public ActionResult Name(string name)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Name == name).Select(x => x);
            return View("Index", query.ToList());
        }

        //GET: Product/Resolution/byName
        public ActionResult Resolution(string resolution)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Resolution == resolution).Select(x => x);
            return View("Index", query.ToList());
        }

        //GET: Product/Ratio/Ratio
        public ActionResult Ratio(string ratio)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Ratio == ratio).Select(x => x);
            return View("Index", query.ToList());
        }

        //GET: Product/Hz/byhz
        public ActionResult Hz(string hz)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Hz == hz).Select(x => x);
            return View("Index", query.ToList());
        }

        //GET: Product/Size/size
        public ActionResult Size(string size)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Size == size).Select(x => x);
            return View("Index", query.ToList());
        }

        public ActionResult Brand(string brand)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Brand == brand).Select(x => x);
            return View("Index", query.ToList());
        }

        //GET: Product/Price/price
        public ActionResult Price(int price)
        {
            List<Images> mylist = db.Images.ToList();
            ViewBag.Image = mylist;
            IEnumerable<Products> query = null;
            query = db.Product.Where(p => p.Price == price).Select(x => x);
            return View("Index", query.ToList());
        }

        // GET: Products/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Price,Description,Brand,Size,Name,Resolution,Ratio,Hz")] Products products)
        {
            if (ModelState.IsValid)
            {
                db.Product.Add(products);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(products);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
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
        public ActionResult Edit([Bind(Include = "ID,Price,Description,Brand,Size,Name,Resolution,Ratio,Hz")] Products products)
        {
            if (ModelState.IsValid)
            {
                db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(products);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
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
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.Product.Find(id);
            db.Product.Remove(products);
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

        public ActionResult AddToBasket(int? id)
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

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products product = db.Product.Find(id);
            Basket entryToAddToBasket = new Basket(product.ID, getCustomerID, product);
            if (product == null)
            {
                return HttpNotFound();
            }

            var query = (from a in db.Basket
                         where a.CustomerID == getCustomerID && a.Products.ID == product.ID && a.OrderList == null
                         select a).FirstOrDefault();

            if (query != null)
            {
                var result = db.Basket.SingleOrDefault(b => b.CustomerID == getCustomerID && b.Products.ID == product.ID && b.OrderList == null);
            }
            else
            {
                entryToAddToBasket.Quantity = 1;
                db.Basket.Add(entryToAddToBasket);
            }
            db.SaveChanges(); return RedirectToAction("Index");
        }
    }
}
