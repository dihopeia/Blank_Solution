using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "ByBrand",
                url: "Products/Brand/{brand}",
                defaults: new { controller = "Products", action = "Brand" }
            );

            routes.MapRoute(
                name: "ByName",
                url: "Products/Name/{name}",
                defaults: new { controller = "Products", action = "Name" }
            );

            routes.MapRoute(
                name: "ByResolution",
                url: "Products/Resolution/{resolution}",
                defaults: new { controller = "Products", action = "Resolution" }
            );

            routes.MapRoute(
                name: "ByPrice",
                url: "Products/Price/{price}",
                defaults: new { controller = "Products", action = "Price" }
            );

            routes.MapRoute(
                name: "BySize",
                url: "Products/Size/{size}",
                defaults: new { controller = "Products", action = "Size" }
            );

            routes.MapRoute(
                name: "ByRatio",
                url: "Products/Ratio/{ratio}",
                defaults: new { controller = "Products", action = "Ratio" }
            );

            routes.MapRoute(
                name: "ByHz",
                url: "Products/Hz/{hz}",
                defaults: new { controller = "Products", action = "Hz" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
