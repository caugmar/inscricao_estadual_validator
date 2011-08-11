ValidacaoInscricaoEstadual.registrar_estado("RJ")

module ValidacaoInscricaoEstadual
  class RJ < Base
    def setup
      @pesos = ["2", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 9
      @digitos_tamanho = 1
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      digito1 = ((11 - resto) == 10 or (11 - resto) == 11) ? 0 : (11 - resto)
    end
  end
end
