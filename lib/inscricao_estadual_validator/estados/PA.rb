ValidacaoInscricaoEstadual.registrar_estado("PA")

module ValidacaoInscricaoEstadual
  class PA < Base
    def setup
      @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 9
      @digitos_tamanho = 1
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito1 = (resto <= 1) ? 0 : (11 - resto)
    end
  end
end
