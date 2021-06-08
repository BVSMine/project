using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace covidcrud.Models
{
    public class daily
    {
        public int dailyconfirmed { get; set; }
        public int dailydeceased { get; set; }
        public int dailyrecovered { get; set; }
        public string date { get; set; }
        public DateTime? dateymd { get; set; }
        public int totalconfirmed { get; set; }
        public int totaldeceased { get; set; }
        public int totalrecovered { get; set; }
    }
}