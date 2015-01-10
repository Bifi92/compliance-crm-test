class Lead < ActiveRecord::Base
  belongs_to :country
  belongs_to :estado
  belongs_to :cidade

  belongs_to :proprietario_user,
             :class_name => "User",
             :foreign_key => "proprietario_user_id"

  validates_presence_of :empresa, :sobrenome, :status
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, :allow_blank => true

  scope :by_user_id, -> (proprietario_user_id) { where(:proprietario_user_id => proprietario_user_id) }

  def to_s
    "#{nome} #{sobrenome}".strip
  end 

  def proprietario_user_name
    User.find(self.proprietario_user_id).name
  end

  def execute_conversion (current_user_id, proprietario_user_id, conta_id, enviar_email)
    
    if proprietario_user_id.blank?
      proprietario_user_id = self.proprietario_user_id
    end

    if conta_id.blank?
      conta_id = Contum.create!(:nome => self.empresa, :qtde_funcionarios => self.qtde_funcionarios, :tipo_conta => "Prospect", :setor => self.setor, :receita_anual => self.receita_anual, :proprietario_user_id => proprietario_user_id, :criador_user_id => current_user_id, :ultimoalterar_user_id => current_user_id ).id
    end

    Contato.create!(:contum_id => conta_id, :saudacao => self.saudacao, :titulo => self.titulo, :nome => self.nome, :sobrenome => self.sobrenome, :empresa => self.empresa, :descricao => self.descricao, :email_pessoal => self.email, :recusar_emails => self.recusar_emails, :fax => self.fax, :telefone_residencial => self.telefone, :celular => self.celular, :recusar_telefonemas => self.recusar_telefonemas, :countrycorre_country_id => self.country_id, :estadocorre_estado_id => self.estado_id, :cidadecorre_cidade_id => self.cidade_id, :rua_corre => self.rua, :cep_corre => self.cep, :origem_lead => self.origem, :proprietario_user_id => proprietario_user_id, :criador_user_id => current_user_id, :ultimoalterar_user_id => current_user_id )

    Lead.update(self.id, :proprietario_user_id => proprietario_user_id, :convertido => true)

    return conta_id

  end  

  def tipos_sim_nao
  	[['Sim','Sim'],['Não','Não']]
  end

  def tipos_saudacao
    [['Sr.', 'Sr.'] ,['Sra.', 'Sra.']]
  end

  def tipos_status
    [['Aberto - Não contatado', 'Aberto - Não contatado'],['Trabalhando - Contatado', 'Trabalhando - Contatado'], ['Fechado - Convertido', 'Fechado - Convertido'], ['Fechado - Não convertido', 'Fechado - Não convertido']]
  end

  def tipos_erp
  	[['EBS', 'EBS'],['JDE','JDE'],['Peoplesoft', 'Peoplesoft'],['SAP', 'SAP'],['B1', 'B1'], ['Outro','Outro']]  	
  end

  def tipos_solucao_fiscal
  	[['Mastersaf','Mastersaf'],['GF Alliance','GF Alliance'],['Smart','Smart'],['Synchro','Synchro'],['PW-SATI','PW-SATI'],['Easyway','Easyway'],['Outro','Outro']]
  end

  def tipos_origem
  	[['WEB','WEB'],['Referencia parceiro','Referencia parceiro'],['Telefonema','Telefonema'],['Lista adquirida','Lista adquirida'],['Evento','Evento'],['Campanha','Campanha'],['Outro','Outro']]
  end

  def tipos_classificacao
  	[['Quente','Quente'],['Morno','Morno'],['Frio','Frio']]
  end

  def tipos_setor
  	[['Agricultura','Agricultura'],['Alimentação e bebidas','Alimentação e bebidas'],['Ambiental','Ambiental'],['Bancos','Bancos']]
  end

end
