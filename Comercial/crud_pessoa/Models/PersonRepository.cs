using System.Collections.Generic;

namespace crud_pessoa.Models
{
    public class PersonRepository
    {
        public static List<Person> people = new List<Person>();

        public PersonRepository(){
            if(people.Count == 0)
                this.Fill();
        }
        public void Fill()
        {
            people.Add(new Person(1,"Alexandre","123"));
            people.Add(new Person(2,"Alexandre","123"));
            people.Add(new Person(3,"Alexandre","123"));
            people.Add(new Person(4,"Alexandre","123"));
            people.Add(new Person(5,"Alexandre","123"));
            people.Add(new Person(6,"Alexandre","123"));
            people.Add(new Person(7,"Alexandre","123"));
            people.Add(new Person(8,"Alexandre","123"));
            people.Add(new Person(9,"Alexandre","123"));
            people.Add(new Person(10,"Alexandre","123"));
            people.Add(new Person(11,"Alexandre","123"));
            people.Add(new Person(12,"Alexandre","123"));
        }
        public void Create(Person person)
        {
            people.Add(person);
        }

        public void Delete(int id)
        {
            Person toDelete = people.Find(a=>a.id == id);
            people.Remove(toDelete);
        }

        public void Update(Person person)
        {

        }

        public Person GetById(int id)
        {
            return null;
        }

        public List<Person> GetAll()
        {
            return people;
        }

    }
}