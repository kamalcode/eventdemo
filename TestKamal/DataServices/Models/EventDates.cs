using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TestKamal.DataServices.Models
{
    public class EventDates
    {


        [Key]
        public int Id
        {
            get;
            set;
        }

        public int EventId
        {
            get;
            set;
        }

        public DateTime StartDate
        {
            get;
            set;
        }

        public DateTime EndDate
        {
            get;
            set;
        }

        public int NumOfPeople
        {
            get;
            set;
        }



    }
}
