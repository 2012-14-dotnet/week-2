using System;
using System.Collections.Generic;

#nullable disable

namespace DataFirst.Storage
{
    public partial class Crust
    {
        public Crust()
        {
            Pizzas = new HashSet<Pizza>();
        }

        public byte CrustId { get; set; }
        public string Name { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Pizza> Pizzas { get; set; }
    }
}
