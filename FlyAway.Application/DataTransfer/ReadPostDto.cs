﻿using FlyAway.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlyAway.Application.DataTransfer
{
    public class ReadPostDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string ImageUrl { get; set; }
        public DateTime PublishedAt { get; set; }
        public string Author { get; set; }
        public string CategoryName { get; set; }
        public int TotalComments { get; set; }
        public IEnumerable<ReadCommentDto> Comments { get; set; } = new List<ReadCommentDto>();
        public IEnumerable<string> Tags { get; set; } = new List<string>();
    }
}
