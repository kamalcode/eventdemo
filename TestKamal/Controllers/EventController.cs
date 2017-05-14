using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TestKamal.DataServices.DbContexts;
using TestKamal.DataServices.Models;

// For more information on enabling Web API for empty projects, visit http://go.microsoft.com/fwlink/?LinkID=397860

namespace TestKamal.Controllers
{
    [Produces("application/json")]
    [Route("api/eventproxy")]
    public class EventController : Controller
    {
        private readonly DataContext _context;


        public EventController(DataContext context)
        {
            _context = context;
        }

       // GET: api/values
       [HttpGet]
       [Route("events")]
        public IEnumerable<EventMaster> Getevents()
        {
            return _context.EventMaster;
        }

        [HttpGet]
        [Route("events/{pageIndex}/{pageSize}")]
        public PagedResponse Getevents(int pageIndex, int pageSize)
        {
            var list = _context.EventMaster.Select(x => new
            {
                EventId = x.EventId,
                EventName = x.EventName,
                ImageId = x.EventImages.FirstOrDefault(p=>p.EventId == x.EventId).ImageId
            });

            return new PagedResponse(list, pageIndex, pageSize);
        }

        [HttpGet]
        [Route("event/{eventId}")]
        public dynamic Getevent(int eventId)
        {
            var eventDetails = _context.EventMaster.Where(m => m.EventId == eventId).Select(m => new
            {
             EventName= m.EventName,
             EventImages = _context.EventImages.Where(d => d.EventId == eventId).ToList(),
             EventDates = _context.EventDates.Where(d => d.EventId == eventId).ToList()
            }
            );
            return eventDetails;
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }

    public class PagedResponse
    {
        public PagedResponse(IEnumerable<dynamic> data, int pageIndex, int pageSize)
        {
            Data = data.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            Total = data.Count();
        }

        public int Total { get; set; }
        public ICollection<dynamic> Data { get; set; }
    }
}
