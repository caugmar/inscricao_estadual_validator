require 'rubygems'
require 'test/unit'
require 'active_model'
require 'inscricao_estadual_validator'
require 'ostruct'

class Company < OpenStruct
  include ActiveModel::Validations
  validates :inscricao_estadual, :inscricao_estadual => true
end
