namespace aula06.Models
{
    public class Medico:Pessoa
    {
        #region Atributos
            public string CRM { get; set; }
        #endregion

        #region Construtores
            public Medico(
                        string pNome, 
                        int pIdade,string pCRM) 
                        : base(pNome, pIdade)
            {
                CRM = pCRM;
            }
         #endregion

        #region Metodos
            
            public override void Salvar(Pessoa pPessoa)
            {
                base.Save(pPessoa)
            }
        #endregion
        
    }
}