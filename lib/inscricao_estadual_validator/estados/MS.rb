ValidacaoInscricaoEstadual.registrar_estado("MS")

class Validacao
  def setup
    @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
    @cadastro_tamanho = 9
    @digitos_tamanho = 1
  end

  def calcular
    resto = multiplicar_pesos_com_numeros_cadastro % 11
    @digito1 = 0 if resto.to_s.to_i == 0

    if resto > 1
      t = 11 - resto
    end

    @digito1 = 0 if t > 9
    @digito1 = t if t < 10
  end
end
