using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TestKamal.DataServices.DbContexts;
using TestKamal.DataServices.Models;

// For more information on enabling MVC for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace TestKamal.Controllers
{
    [Produces("application/json")]
    [Route("api/StudentMastersAPI")]
    public class StudentMastersAPI : Controller
    {
        private readonly DataContext _context;


        public StudentMastersAPI(DataContext context)
        {
            _context = context;
        }
        // GET: /<controller>/
        //[HttpGet]
        //[Route("Student")]
        //public IEnumerable<EventMasters> GetStudentMasters()
        //{
        //    return _context.StudentMasters;

        //}
    }
}
