using System;

namespace injecao.Models
{
    public class RenderTransient:IRenderTransient
    {
        public Guid GetGuidNow {get;private set;} = Guid.NewGuid();
    }
}