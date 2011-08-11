ValidacaoInscricaoEstadual.registrar_estado("RN")

module ValidacaoInscricaoEstadual
  class RN < Base
    def setup
      @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
      @pesos2 = ["10", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 10
      @digitos_tamanho = 1
    end

    def calcular
      if @cadastro.length == 9
        resto = (multiplicar_pesos_com_numeros_cadastro * 10) % 11
        @digito1 = (resto == 10) ? 0 : resto
      elsif @cadastro.length == 10
        resto = (multiplicar_pesos_com_numeros_cadastro(@cadastro, @pesos2, 1) * 10) % 11
        @digito1 = (resto == 10) ? 0 : resto
      end
    end
  end
end
