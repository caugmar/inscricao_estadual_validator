class InscricaoEstadualValidator < ActiveModel::EachValidator
  autoload :InscricaoEstadual, 'inscricao_estadual_validator/inscricao_estadual'

  def validate_each(record, attribute, value)
      return if value.blank?
      valido = false
      ValidacaoInscricaoEstadual.estados.each do |estado|
          valido = eval("ValidacaoInscricaoEstadual::#{estado}.new(estado, value).valido?")
          break if valido 
      end
      record.errors.add(attribute, options[:message]) unless valido
  end
end
