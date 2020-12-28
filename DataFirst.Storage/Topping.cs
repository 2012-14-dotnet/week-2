using System;
using System.Collections.Generic;
using System.Linq;

#nullable disable

namespace DataFirst.Storage
{
  public partial class Topping
  {
    public Topping()
    {
      PizzaToppings = new HashSet<PizzaTopping>();
    }

    public short ToppingId { get; set; }
    public string Name { get; set; }
    public bool? Active { get; set; }
    public decimal Price { get; set; }

    public virtual ICollection<PizzaTopping> PizzaToppings { get; set; }

    private void GetTopping(string name)
    {
      var c = new PizzaContext();

      var t = c.Toppings.FirstOrDefault(t => t.Name == name); // select name from Pizza.Topping where Name = name;
    }
  }
}
