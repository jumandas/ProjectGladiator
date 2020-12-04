using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusRes.Models;


namespace BusRes.Controllers
{
    public class CustomerController : ApiController
    {
        dbNewBusEntities1 db = new dbNewBusEntities1();


        [Route("Getcustomer")]
        public HttpResponseMessage Get()
        {
            var cust = db.tblCustomers.ToList();
            if (cust.Count > 0)
            {
                return Request.CreateResponse(HttpStatusCode.OK, cust);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "No data found.");
            }
        }
        [Route("Api/Customer/createcontact")]
        [HttpPost]
         public object createcontact(Registration rvm)
         {
            try
            {
               
                dbNewBusEntities1 db = new dbNewBusEntities1();
                tblCustomer customer = new tblCustomer();
                if (customer.EmailId == null)
                {
                    customer.username = rvm.username;
                    customer.Fname = rvm.Fname;
                    customer.Lname = rvm.Lname;
                    customer.Password_ = rvm.Password_;
                    customer.EmailId = rvm.EmailId;
                    customer.ContactNo = rvm.ContactNo;
                    customer.Address = rvm.Address;
                    customer.DOB = rvm.DOB;
                    customer.Gender = rvm.Gender;
                    // customer.WalletDetails = wallet;
                    db.tblCustomers.Add(customer);
                    db.SaveChanges();
                    return new Response
                    {
                        Status = "Success",
                        Message = "SuccessFully Saved."
                    };
                }
            }
            catch (Exception)
            {

                throw;

            }
            return new Response
            {
                Status = "Error",
                Message = "Invalid Data."
            };

        }   
        
        /*public string Post(tblCustomer cust)
        {
            try
            {
                string query = @"
                    insert into dbo.tblCustomer values
                    (
                    '" + cust.username + @"'
                    ,'" + cust.Fname + @"'
                    ,'" + cust.Lname + @"'
                    ,'" + cust.Password_ + @"'
                    ,'" + cust.EmailId + @"'
                    ,'" + cust.ContactNo + @"'
                    ,'" + cust.Address + @"'
                    ,'" + cust.DOB + @"'
                    ,'" + cust.Gender + @"'
                    )
                    ";

                DataTable table = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.
                    ConnectionStrings["dbNewBus"].ConnectionString))
                using (var cmd = new SqlCommand(query, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.Text;
                    da.Fill(table);
                }

                return "Added Successfully!!";
            }
            catch (Exception)
            {

                return "Failed to Add!!";
            }
        }*/


    }
}
