ValidacaoInscricaoEstadual.registrar_estado("MT")

module ValidacaoInscricaoEstadual
  class MT < Base
    def setup
      @pesos = ["3", "2", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 11
      @digitos_tamanho = 1
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito1 = ((11 - resto) >= 2) ? (11 - resto) : 0
    end
  end
end
