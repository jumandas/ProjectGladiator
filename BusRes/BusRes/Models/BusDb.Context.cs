﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BusRes.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbNewBusEntities1 : DbContext
    {
        public dbNewBusEntities1()
            : base("name=dbNewBusEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblAdmin> tblAdmins { get; set; }
        public virtual DbSet<tblBooking> tblBookings { get; set; }
        public virtual DbSet<tblBu> tblBus { get; set; }
        public virtual DbSet<tblCancellation> tblCancellations { get; set; }
        public virtual DbSet<tblCustomer> tblCustomers { get; set; }
        public virtual DbSet<tblPayment> tblPayments { get; set; }
        public virtual DbSet<tblReturnTicket> tblReturnTickets { get; set; }
        public virtual DbSet<tblUnAuthCustomer> tblUnAuthCustomers { get; set; }
    }
}
