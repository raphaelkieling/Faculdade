namespace crud_pessoa.Models
{
    public class Person
    {

        public Person(){}
        public Person(int id, string name, string address)
        {
            this.id = id;
            this.name = name;
            this.address = address;

        }
        public int id { get; private set; }
        public string name { get; set; }
        public string address { get; set; }
    }
}