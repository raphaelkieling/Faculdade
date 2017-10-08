using System;

namespace injecao.Models
{
    public class RenderSingleton:IRenderSingleton
    {
        public Guid GetGuidNow {get;private set;} = Guid.NewGuid();
    }
}