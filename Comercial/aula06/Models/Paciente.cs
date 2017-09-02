namespace aula06.Models
{
    public class Paciente:Pessoa
    {
        public int numeroPlanoSaude { get; set; }

        public Paciente(string pNome,
                        int pIdade,
                        int pNumeroPlanoSaudade
                        ):base(pNome,pIdade)
        {
            numeroPlanoSaude = pNumeroPlanoSaudade;
        }
    }
}