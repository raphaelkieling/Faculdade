using System;

namespace injecao.Models
{
    public class RenderScoped : IRenderScope
    {
        public Guid GetGuidNow {get;private set;} = Guid.NewGuid();
    }
}