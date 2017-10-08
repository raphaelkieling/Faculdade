using System;

namespace injecao.Models
{
    public interface IRender
    {
         Guid GetGuidNow { get; }
    }
}