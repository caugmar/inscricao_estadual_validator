ValidacaoInscricaoEstadual.registrar_estado("AM")

class Validacao
  def setup
    @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
    @cadastro_tamanho = 9
    @digitos_tamanho = 1
  end

  def calcular
    digito1 = 0
    if multiplicar_pesos_com_numeros_cadastro.to_s.to_i < 11
      @digito1 = 11 - multiplicar_pesos_com_numeros_cadastro
    else
      if (multiplicar_pesos_com_numeros_cadastro % 11).to_s.to_i <= 1
        @digito1 = 0
      else
        @digito1 = 11 - (multiplicar_pesos_com_numeros_cadastro % 11).to_s.to_i
      end
    end
  end
end
