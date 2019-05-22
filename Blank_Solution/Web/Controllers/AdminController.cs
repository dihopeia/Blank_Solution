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

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AdminProducts()
        {
            ViewBag.Message = "AdminProducts";

            return View();
        }

        public ActionResult AdminBaskets()
        {
            ViewBag.Message = "AdminBaskets";

            return View();
        }

        public ActionResult AdminOrders()
        {
            ViewBag.Message = "AdminOrders";

            return View();
        }

        public ActionResult AdminHistory()
        {
            ViewBag.Message = "AdminHistory";

            return View();
        }
    }
}