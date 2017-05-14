using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestKamal.DataServices.Models;

namespace TestKamal.DataServices.DbContexts
{
    public class DataContext: DbContext
    {
        public DataContext(DbContextOptions<DataContext> options): base(options)
        {

        }

        public DataContext()
        {
        }
        public DbSet<EventMaster> EventMaster
        {
            get;
            set;
        }

        public DbSet<EventDates> EventDates
        {
            get;
            set;
        }

        public DbSet<EventImages> EventImages
        {
            get;
            set;
        }
    }
}
