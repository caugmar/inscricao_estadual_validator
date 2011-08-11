ValidacaoInscricaoEstadual.registrar_estado("RO")

module ValidacaoInscricaoEstadual
  class RO < Base
    def setup
      @pesos = ["6", "5", "4", "3", "2", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 14
      @digitos_tamanho = 1

      if @cadastro.length == 9
        @cadastro = @cadastro[3..@cadastro.length]

        while @cadastro.length <= 13
          @cadastro[1..@cadastro.length] = @cadastro
          @cadastro[0] = "0"
        end
      end
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito1 = ((11 - resto) == 10 or (11 - resto) == 11) ? ((11 - resto) - 10) : (11 - resto)
    end
  end
end
