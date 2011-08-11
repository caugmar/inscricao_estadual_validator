ValidacaoInscricaoEstadual.registrar_estado("PE")

module ValidacaoInscricaoEstadual
  class PE < Base
    def setup
      @pesos = ["5", "4", "3", "2", "1", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 14
      @digitos_tamanho = 1
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito1 = ((11 - resto) > 9) ? ((11 - resto) - 10) : (11 - resto)
    end
  end
end
