ValidacaoInscricaoEstadual.registrar_estado("DF")

module ValidacaoInscricaoEstadual
  class DF < Base
    def setup
      @pesos = ["4", "3", "2", "9", "8", "7", "6", "5", "4", "3", "2"]
      @pesos_digito2 = ["5", "4", "3", "2", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 13
      @digitos_tamanho = 2
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito2 = ((11 - resto) == 10 or (11 - resto) == 11) ? 0 : (11 - resto)

      resto = (multiplicar_pesos_com_numeros_cadastro(@cadastro[0..10].push(@digito2), @pesos_digito2, 0) % 11)
      @digito1 = ((11 - resto) == 10 or (11 - resto) == 11) ? 0 : (11 - resto)
    end
  end
end
