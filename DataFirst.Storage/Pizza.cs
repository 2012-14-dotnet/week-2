using System;
using System.Collections.Generic;

#nullable disable

namespace DataFirst.Storage
{
    public partial class Pizza
    {
        public Pizza()
        {
            PizzaToppings = new HashSet<PizzaTopping>();
        }

        public byte PizzaId { get; set; }
        public byte CrustId { get; set; }
        public byte SizeId { get; set; }
        public string Name { get; set; }
        public bool? Active { get; set; }
        public DateTime? DateModified { get; set; }

        public virtual Crust Crust { get; set; }
        public virtual Size Size { get; set; }
        public virtual ICollection<PizzaTopping> PizzaToppings { get; set; }
    }
}
