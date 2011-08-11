module ValidacaoInscricaoEstadual
    class Base
        attr_reader :pesos
        attr_reader :cadastro
        attr_reader :cadastro_tamanho
        attr_reader :digitos_tamanho

        def initialize(classe, cadastro)
            begin 
                @cadastro = cadastro.scan(/[0-9]/).collect{|x| x.to_i}
                @uf = classe

                setup
                calcular

            rescue LoadError
                puts "Classe nao encontrada"
                exit
            end
        end

        private
        def validar
            acertos = 0
            1.upto(@digitos_tamanho) do |i|
                eval <<-EOF
        if @digito#{i}.to_i == @cadastro[@cadastro.length-i].to_i 
          acertos += 1
        end
                EOF
            end

            acertos == @digitos_tamanho
        end

        private
        def validar_formato
            if @cadastro.to_s.length > @cadastro_tamanho
                puts "Numero de inscricao estadual muito grande => #{@uf}" if @uf == "AC"
                return false
            end
            return true
        end

        private
        def multiplicar_pesos_com_numeros_cadastro(cadastro = @cadastro.clone, pesos = @pesos, tamanho = @digitos_tamanho)
            soma = 0
            cadastro = cadastro.clone

            0.upto(cadastro.length - tamanho) do |i|
                soma += pesos[i].to_i * cadastro[i].to_i
            end

            soma
        end

        public
        def valido?
            #  print "testando #{@uf} => " if @uf == "AC"
            if validar_formato
                #     print "passo" if @uf == "AC"
                #      puts if @uf == "AC"
                return validar
            else
                #       print "nao" if @uf == "AC"
                #        puts if @uf == "AC"
                return false
            end
        end
    end

    def self.estados
        @estados ||= []
    end

    def self.registrar_estado(estado)
        estados.push(estado) if not estados.include?(estado)
    end
end

require 'estados/AC'
require 'estados/AL'
require 'estados/AP'
require 'estados/BA'
require 'estados/CE'
require 'estados/DF'
require 'estados/ES'
require 'estados/GO'
require 'estados/MA'
require 'estados/MT'
require 'estados/MG'
require 'estados/PA'
require 'estados/PB'
require 'estados/PR'
require 'estados/PE'
require 'estados/PI'
require 'estados/RJ'
require 'estados/RN'
require 'estados/RS'
require 'estados/RO'
require 'estados/RR'
require 'estados/SC'
require 'estados/SP'
require 'estados/SE'
require 'estados/TO'

