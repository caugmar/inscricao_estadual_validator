ValidacaoInscricaoEstadual.registrar_estado("PR")

module ValidacaoInscricaoEstadual
  class PR < Base
    def setup
      @pesos = ["3", "2", "7", "6", "5", "4", "3", "2"]
      @pesos_digito2 = ["4", "3", "2", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 10
      @digitos_tamanho = 2
    end

    def calcular
      resto = multiplicar_pesos_com_numeros_cadastro % 11
      @digito2 = (resto <= 1) ? 0 : (11 - resto)
      cad = @cadastro.clone
      resto = multiplicar_pesos_com_numeros_cadastro((cad.push(@digito2.to_s)), @pesos_digito2) % 11
      @digito1 = ((11 - resto) == 10 or (11 - resto) == 11) ? 0 : (11 - resto)
    end
  end
end
