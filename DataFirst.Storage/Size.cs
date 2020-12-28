using System;
using System.Collections.Generic;
using System.Linq;

#nullable disable

namespace DataFirst.Storage
{
  public partial class Size
  {
    public Size()
    {
      Pizzas = new HashSet<Pizza>();
    }

    public byte SizeId { get; set; }
    public string Name { get; set; }
    public bool? Active { get; set; }

    public virtual ICollection<Pizza> Pizzas { get; set; }
  }
}
