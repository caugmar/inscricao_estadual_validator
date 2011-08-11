ValidacaoInscricaoEstadual.registrar_estado("BA")

module ValidacaoInscricaoEstadual
  class BA < Base
    def setup
      @pesos = ["8", "7", "6", "5", "4", "3", "2"]
      @pesos_digito2 = ["7", "6", "5", "4", "3", "2"]
      @pesos2 = ["7", "6", "5", "4", "3", "2"]
      @pesos3 = ["8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 8
      @digitos_tamanho = 2
    end

    def calcular
      @digito1 = 0,
      @digito2 = 0

      if @cadastro.to_s =~ /^[0-5|8].*/
        resto = multiplicar_pesos_com_numeros_cadastro(@cadastro, @pesos_digito2) % 10
        @digito1 = (10 - resto)

        resto = multiplicar_pesos_com_numeros_cadastro(@cadastro[0..5].push(@digito1.to_s), @pesos, 0) % 10
        @digito2 = (10 - resto)    
      elsif @cadastro.to_s =~ /^[6-9]/
        resto = multiplicar_pesos_com_numeros_cadastro(@cadastro, @pesos2) % 11

        @digito1 = (resto <= 1) ? 0 : (11 - resto)
        
        resto = multiplicar_pesos_com_numeros_cadastro(@cadastro[0..5].push(@digito1.to_s), @pesos3, 0) % 11
        @digito2 = (11 - resto)
      end
    end
  end
end
