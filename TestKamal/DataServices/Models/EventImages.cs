using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TestKamal.DataServices.Models
{
    public class EventImages
    {

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


        public int ImageId
        {
            get;
            set;
        }


        public string Description
        {
            get;
            set;
        }
    }
}
