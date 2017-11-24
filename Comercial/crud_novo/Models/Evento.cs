namespace crud_pessoa.Models
{
    public class Evento
    {

        public Evento(){}
        public Evento(int id, string name, string address,string data,int numeroAproximado)
        {
            this.id = id;
            this.name = name;
            this.address = address;
            this.data = data;
            this.numeroAproximado = numeroAproximado;
        }
        public int id { get; private set; }
        public string name { get; set; }
        public string address { get; set; }
        public string data { get; set; }
        public int numeroAproximado { get; set; }
    }
}