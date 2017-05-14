using System;   
using System.Collections.Generic;   
using System.Linq;   
using System.Threading.Tasks;   
using System.ComponentModel.DataAnnotations; 

namespace TestKamal.DataServices.Models
{
    public class EventMaster
    {
        [Key]
        public int EventId
        {
            get;
            set;
        }

        public string EventName
        {
            get;
            set;
        }

        public virtual ICollection<EventImages> EventImages
        {
            get;
            set;
        }
    }
}
