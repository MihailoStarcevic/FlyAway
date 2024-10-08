﻿using FlyAway.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlyAway.Application.Searches
{
    public class PostSearch : PagedSearch
    {
        public string? Keyword { get; set; }
        public int Id { get; set; }
        public string? Title { get; set; }
        public string? Content { get; set; }
        public DateTime? PublishedBefore { get; set; }
        public DateTime? PublishedAfter { get; set; }
        public int? UserId { get; set; }
        public int? CategoryId { get; set; }
    }
}
