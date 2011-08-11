class InscricaoEstadualValidator < ActiveModel::EachValidator
  autoload :InscricaoEstadual, 'inscricao_estadual_validator/inscricao_estadual'

  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message]) unless InscricaoEstadual.valid?(value)
  end
end
