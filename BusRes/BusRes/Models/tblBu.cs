//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tblBu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblBu()
        {
            this.tblBookings = new HashSet<tblBooking>();
        }
    
        public string BusNo { get; set; }
        public int NoOfSeats { get; set; }
        public string Source_ { get; set; }
        public string Destination { get; set; }
        public string ViaStop { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public float PerSeatCost { get; set; }
        public bool BusType { get; set; }
        public string BusName { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblBooking> tblBookings { get; set; }
    }
}
