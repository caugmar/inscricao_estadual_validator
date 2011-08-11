ValidacaoInscricaoEstadual.registrar_estado("SP")

module ValidacaoInscricaoEstadual
  class SP < Base
    private
    def validar_formato
    end

    def initialize(classe, cadastro)
      begin
 #       puts cadastro
        @cadastro = []
        @uf = classe
        
        0.upto(cadastro.length-1) do |i|
          @cadastro.push(cadastro[i].chr)
        end

        setup
        calcular
        
      rescue LoadError
        puts "Classe nao encontrada"
        exit
      end
    end
    
    def setup
      @pesos = ["1", "3", "4", "5", "6", "7", "8", "10"]
      @pesos2 = ["3", "2", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
      @pesos3 = ["1", "3", "4", "5", "6", "7", "8", "10"]
      
      @rural = false
      
      if @cadastro.to_s =~ /^P.*/
        @rural = true
      end
    end

    private
    def validar
      if not @rural
        if @cadastro[8].to_i == @digito1.to_i and @cadastro[11].to_i == @digito2.to_i
          return true
        else
          return false
        end
      else
        if @cadastro[8].to_i == @digito1.to_i
          return true
        else
          return false
        end
      end
    end

    public
    def valido?
      return validar
    end

    def calcular
      if not @rural
        @digitos_tamanho = 2
        @cadastro = @cadastro.to_s.scan(/[0-9]/).collect{|x| x.to_i}

        resto = multiplicar_pesos_com_numeros_cadastro(@cadastro, @pesos, 0) % 11
        @digito1 = resto.to_s[resto.to_s.length-1].chr

        resto = multiplicar_pesos_com_numeros_cadastro(@cadastro, @pesos2, 0) % 11
        @digito2 = resto.to_s[resto.to_s.length-1].chr
      else
        @digitos_tamanho = 1
        @cadastro = @cadastro.to_s.scan(/[0-9]/).collect{|x| x.to_i}
        
        cad = @cadastro[@cadastro.index(0)..@cadastro.length]
        cad = cad[0..cad.length-4]

        resto = multiplicar_pesos_com_numeros_cadastro(cad, @pesos3, 0) % 11
        @digito1 = resto.to_s[resto.to_s.length-1].chr

      end
    end
  end
end
