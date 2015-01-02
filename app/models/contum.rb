class Contum < ActiveRecord::Base

  belongs_to :countrycobr_country,
    :class_name => "Country",
    :foreign_key => "countrycobr_country_id"

  belongs_to :countryentr_country,
    :class_name => "Country",
    :foreign_key => "countryentr_country_id"

  belongs_to :estadocobr_estado,
    :class_name => "Estado",
    :foreign_key => "estadocobr_estado_id"

  belongs_to :estadoentr_estado,
    :class_name => "Estado",
    :foreign_key => "estadoentr_estado_id"

  belongs_to :cidadecobr_cidade,
    :class_name => "Cidade",
    :foreign_key => "cidadecobr_cidade_id"

  belongs_to :cidadeentr_cidade,
    :class_name => "Cidade",
    :foreign_key => "cidadeentr_cidade_id"       

  validates_presence_of :nome
  validates :email_nfe, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, :allow_blank => true
  validates_numericality_of :receita_anual, :qtde_funcionarios, :cpf_cnpj, :allow_blank => true

  def to_s
    "#{nome} #{sobrenome}".strip
  end 

  def tipos_propriedade
  	[['Privada','Privada'],['Pública','Pública'],['Subsidiária','Subsidiária']]
  end

  def tipos_conta
  	[['Prospect','Prospect'],['Cliente direto','Cliente direto'],['Cliente canal','Cliente canal'],['Parceiro','Parceiro'],['Potencial parceiro','Potencial parceiro'],['Aliança','Aliança']]
  end

  def tipos_setor
  	[['Agricultura','Agricultura'],['Alimentação e bebidas','Alimentação e bebidas'],['Ambiental','Ambiental'],['Bancos','Bancos']]
  end

end
