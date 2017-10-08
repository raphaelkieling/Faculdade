namespace aulaOO.Models
{
    public class Agencia
    {
        public int Id { get; set; }
        public int Numero { get; set; }
        public Agencia(int pNumero){
            this.Numero = pNumero;
        }
    }
}