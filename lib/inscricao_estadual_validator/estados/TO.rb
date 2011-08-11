ValidacaoInscricaoEstadual.registrar_estado("TO")

module ValidacaoInscricaoEstadual
  class TO < Base
    def setup
      @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 11
      @digitos_tamanho = 1
    end

    def calcular
      cad = @cadastro.clone
      cad.delete_at(3)
      cad.delete_at(3)
      resto = multiplicar_pesos_com_numeros_cadastro(cad, @pesos, 0) % 11
      @digito1 = (resto < 2) ? 0 : (11 - resto)
    end
  end
end
