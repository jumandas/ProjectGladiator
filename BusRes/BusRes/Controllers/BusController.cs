using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusRes.Models;

namespace BusRes.Controllers
{
    public class BusController : ApiController
    {
        dbNewBusEntities1 db = new dbNewBusEntities1();

        //GET
        [Route("Getbuses")]
        public HttpResponseMessage Get()
        {
            var bus = db.tblBus.ToList();
            if (bus.Count > 0)
            {
                return Request.CreateResponse(HttpStatusCode.OK, bus);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "No data found.");
            }
        }


    }
}
