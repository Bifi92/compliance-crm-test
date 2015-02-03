class Contato < ActiveRecord::Base
  extend FriendlyId

  belongs_to :contum
  
  belongs_to :contato

  belongs_to :countrycorre_country,
    :class_name => "Country",
    :foreign_key => "countrycorre_country_id"

  belongs_to :countrycorpo_country,
    :class_name => "Country",
    :foreign_key => "countrycorpo_country_id"

  belongs_to :estadocorre_estado,
    :class_name => "Estado",
    :foreign_key => "estadocorre_estado_id"

  belongs_to :estadocorpo_estado,
    :class_name => "Estado",
    :foreign_key => "estadocorpo_estado_id"

  belongs_to :cidadecorre_cidade,
    :class_name => "Cidade",
    :foreign_key => "cidadecorre_cidade_id"

  belongs_to :cidadecorpo_cidade,
    :class_name => "Cidade",
    :foreign_key => "cidadecorpo_cidade_id" 

  validates_presence_of :contum, :sobrenome
  validates :email_pessoal, :email_corporativo, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, :allow_blank => true  

  scope :by_user_id, -> (proprietario_user_id) { where(:proprietario_user_id => proprietario_user_id) }

  friendly_id :nome, use: :slugged  

  def to_s
    "#{nome} #{sobrenome}".strip
  end 

  def tipos_saudacao
    [['Sr.', 'Sr.'] ,['Sra.', 'Sra.']]
  end

  def tipos_sexo
  	[['Masculino','Masculino'],['Feminino','Feminino']]
  end

  def tipos_departamento
    [['Financeiro','Financeiro'],['Fiscal','Fiscal'],['Tecnologia','Tecnologia'],['Comercial','Comercial'],['Jurídico','Jurídico'],['RH','RH'],['Planejamento','Planejamento'],['Produção','Produção'],['Contábil','Contábil'],['Logística','Logística']]
  end

  def tipos_logradouro
    [['Alameda','Alameda'],['Avenida','Avenida'],['Balneário','Balneário'],['Bloco','Bloco'],['Chácara','Chácara'],['Conjunto','Conjunto'],['Condomínio','Condomínio'],['Estrada','Estrada'],['Fazenda','Fazenda'],['Galeria','Galeria'],['Granja','Granja'],['Jardim','Jardim'],['Largo','Largo'],['Loteamento','Loteamento'],['Praça','Praça'],['Praia','Praia'],['Parque','Parque'],['Quadra','Quadra'],['Rua','Rua'],['Setor','Setor'],['Travessa','Travessa'],['Vila','Vila']]
  end

  def tipos_origem
    [['WEB','WEB'],['Referencia parceiro','Referencia parceiro'],['Telefonema','Telefonema'],['Lista adquirida','Lista adquirida'],['Evento','Evento'],['Campanha','Campanha'],['Outro','Outro']]
  end

end