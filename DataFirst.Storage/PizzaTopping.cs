using System;
using System.Collections.Generic;

#nullable disable

namespace DataFirst.Storage
{
    public partial class PizzaTopping
    {
        public int PizzaToppingId { get; set; }
        public byte PizzaId { get; set; }
        public short ToppingId { get; set; }

        public virtual Pizza Pizza { get; set; }
        public virtual Topping Topping { get; set; }
    }
}
