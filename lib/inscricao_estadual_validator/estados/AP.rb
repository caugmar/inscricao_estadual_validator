ValidacaoInscricaoEstadual.registrar_estado("AP")

module ValidacaoInscricaoEstadual
  class AP < Base
    def setup
      @pesos = ["9", "8", "7", "6", "5", "4", "3", "2"]
      @cadastro_tamanho = 9
      @digitos_tamanho = 1
    end

    def calcular
      faixas = [
                [["03000001"], ["03017000"], ["5"], ["0"]],
                [["03017001"], ["03019022"], ["9"], ["1"]],
                [["03019023"], ["*"], ["0"], ["0"]]
               ]

      cadastro_sem_dv = @cadastro.to_s[0, @cadastro.to_s.length-1].to_i
      
      p, d = 0
      faixas.each do |faixa_inicial, faixa_final, _p, _d|
        if cadastro_sem_dv.to_i >= faixa_inicial.to_s.to_i and cadastro_sem_dv.to_i <= faixa_final.to_s.to_i
          p = _p.to_s
          d = _d.to_s
        end
      end

      resto = ((p.to_i + multiplicar_pesos_com_numeros_cadastro) % 11)
      @digito1 = ((11 - resto) == 10) ? 0 : ((11 - resto) == 11) ? d : (11 - resto)
    end
  end
end
