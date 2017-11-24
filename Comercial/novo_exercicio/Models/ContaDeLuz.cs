using System;

namespace novo_exercicio.Models
{
    public class ContaDeLuz
    {
        public Guid contaId { get; set; }
        public DateTime data { get; set; }
        public int numeroLeitura { get; set; }
        public double quantidadeKw { get; set; }
        public DateTime dataPagamento { get; set; }
        public double media { get; set;
        }
    }
}