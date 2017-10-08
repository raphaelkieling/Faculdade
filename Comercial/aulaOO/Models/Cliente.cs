namespace aulaOO.Models
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public int Codigo { get; set; }

        public Cliente(string pNome,int pCodigo){
            this.Nome = pNome;
            this.Codigo = pCodigo;
        }
    }
}