ValidacaoInscricaoEstadual.registrar_estado("ES")

module ValidacaoInscricaoEstadual
  class ES < Base
    def setup
      @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 9
      @digitos_tamanho = 1
    end

    def calcular
      resto = (multiplicar_pesos_com_numeros_cadastro * 10)  % 11
      @digito1 = (resto < 2) ? 0 : (resto > 1) ? (11 - resto) : nil
    end
  end
end
