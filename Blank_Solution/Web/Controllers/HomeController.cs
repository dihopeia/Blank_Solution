using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.DataModel;
using Web.Models;

namespace Web.Controllers
{
    public class HomeController : Controller
    {
        private Entity_Data__Modell db = new Entity_Data__Modell();

        public ActionResult Index()
        {
            int currentUser = 0;
            string sessionKey = HttpContext.Session.SessionID;
            string CurrentUserIdentity = System.Web.HttpContext.Current.User.Identity.Name;

            string isSessionIdExist = (from x in db.Anonym
                                       where x.SessionID == sessionKey
                                       select x.SessionID).FirstOrDefault();

            string isUsernNameExist = (from une in new ApplicationDbContext().Users
                                       where une.UserName == CurrentUserIdentity
                                       select une.UserName).SingleOrDefault();

            if (CurrentUserIdentity == isUsernNameExist)
            {
                string isUserExist = (from x in db.Anonym
                                      where x.SessionID == CurrentUserIdentity
                                      select x.SessionID).FirstOrDefault();
                if (isUserExist != CurrentUserIdentity)
                {
                    db.Anonym.Add(new Anonym(CurrentUserIdentity));
                }
                db.SaveChanges();

                currentUser = (from x in db.Anonym
                               where x.SessionID == CurrentUserIdentity
                               select x.ID).FirstOrDefault();
            }
            else
            {

                if (isSessionIdExist != sessionKey)
                {
                    db.Anonym.Add(new Anonym(sessionKey));
                }
                db.SaveChanges();

                currentUser = (from x in db.Anonym
                               where x.SessionID == sessionKey
                               select x.ID).FirstOrDefault();
            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}