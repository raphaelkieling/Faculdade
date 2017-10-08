namespace aulaOO.Models
{
    public class Conta
    {
        public int Numero { get; private set; }
        public double Saldo { get; private set; }
        public double Limite { get; private set; }

        public Conta(int pNumero,double pSaldo){
            this.Numero = pNumero;
            this.Saldo = pSaldo;
            this.Limite = 100;
        }

        public void Deposito(double Valor){
            this.Saldo+=Valor;
        }
    }
}