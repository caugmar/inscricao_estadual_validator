ValidacaoInscricaoEstadual.registrar_estado("RS")

module ValidacaoInscricaoEstadual
  class RS < Base
    def setup
      @pesos = ["2", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 10
      @digitos_tamanho = 1
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito1 = ((11 - resto) == 10 or (11 - resto) == 11) ? 0 : (11 - resto)
    end
  end
end
