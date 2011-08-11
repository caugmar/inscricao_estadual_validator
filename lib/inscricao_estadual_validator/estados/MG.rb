ValidacaoInscricaoEstadual.registrar_estado("MG")

module ValidacaoInscricaoEstadual
  class MG < Base
    def setup
      @pesos = ["1", "2", "1", "2", "1", "2", "1", "2", "1", "2", "1", "2"]
      @pesos2 = ["3", "2", "11", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 13
      @digitos_tamanho = 2
    end

    def calcular
      novo_cadastro = @cadastro[0..10].clone
      el = novo_cadastro[3..novo_cadastro.length]
      novo_cadastro[3] = "0"
      novo_cadastro[4..novo_cadastro.length] = el

      algarismos =  multiplicar_pesos_com_numeros_cadastro3(novo_cadastro, @pesos, 1)

      soma = 0
      0.upto(algarismos.length-1) do |i|
        soma += algarismos[i].chr.to_i
      end

      dezena = 0
      i = soma
      while i <= 99
        if i.to_s =~ /^[1-9]0$/
          dezena = i
          break
        end
        i += 1
      end

      @digito2 = dezena.to_i - 32

      novo_cadastro = @cadastro[0..@cadastro.length-3].push(@digito2)
      resto =  multiplicar_pesos_com_numeros_cadastro2(novo_cadastro, @pesos2, 0) % 11
      
      @digito1 = (resto <= 1) ? 0 : (11 - resto)
    end

    private
    def multiplicar_pesos_com_numeros_cadastro3(cadastro = @cadastro.clone, pesos = @pesos, tamanho = @digitos_tamanho)
      soma = ""
      cadastro = cadastro.clone

      0.upto(cadastro.length - tamanho) do |i|
        soma += (pesos[i].to_i * cadastro[i].to_i).to_s
      end

      soma
    end

    private
    def multiplicar_pesos_com_numeros_cadastro2(cadastro = @cadastro.clone, pesos = @pesos, tamanho = @digitos_tamanho)
      soma = 0
      cadastro = cadastro.clone

      0.upto(cadastro.length - tamanho) do |i|
        soma += pesos[i].to_i * cadastro[i].to_i
      end

      soma
    end
  end
end
