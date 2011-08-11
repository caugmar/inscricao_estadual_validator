ValidacaoInscricaoEstadual.registrar_estado("GO")

module ValidacaoInscricaoEstadual
  class GO < Base
    def setup
      @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 9
      @digitos_tamanho = 1
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito1 = @cadastro.to_s.to_i == "11094402".to_i ? 1 : 0
      @digito1 = 0 if resto == 0 or resto.to_s.nil?

      @cadastro_sem_dv = @cadastro[0..(@cadastro.length-2)].to_s.to_i
      if resto == 1 and @cadastro_sem_dv >= "10103105".to_i and @cadastro_sem_dv <= "10119997".to_i
        @digito1 = 1
      else
        @digito1 = 0
      end
      
      @digito1 = (resto >= 2) ? (11 - resto) : nil
    end
  end
end
