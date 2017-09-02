namespace aula06.Models
{
    public abstract class Pessoa
    {
       public string nome{ get; private set; }
       public int idade        { get; private set; }
    //    public string GetEndereco()
    //    {
    //        return endereco;
    //    }
    //    public void SetEndereco(strint pEndereco)
    //    {
    //        endereco = pEndereco;
    //    }
        public Pessoa(string pNome,int pIdade)
        {
            nome = pNome;
            idade = pIdade;
        }

        public void Salvar(Pessoa pPessoa){

        }
    }
}