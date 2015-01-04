class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @leads = Lead.where(:proprietario_user_id => current_user.id)
    respond_with(@leads)
  end

  def show
    respond_with(@lead)
  end

  def new
    @lead = Lead.new
    respond_with(@lead)
  end

  def edit
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.criador_user_id = current_user.id
    @lead.proprietario_user_id = current_user.id
    @lead.ultimoalterar_user_id = current_user.id
    @lead.save
    respond_with(@lead)
  end

  def update
    @lead.ultimoalterar_user_id = current_user.id
    @lead.update(lead_params)
    respond_with(@lead)
  end

  def destroy
    @lead.destroy
    respond_with(@lead)
  end

  def convert
  end  

  private
    def set_lead
      @lead = Lead.find(params[:id])
    end

    def lead_params
      params.require(:lead).permit(:saudacao, :empresa, :nome, :sobrenome, :titulo, :status, :descricao, :erp, :solucao_fiscal, :country_id, :estado_id, :cidade_id, :rua, :cep, :origem, :reconhecido, :classificacao, :motivo_desqualificacao, :orcamento_aprovado, :convertido, :data_da_conversao, :fax, :celular, :telefone, :recusar_telefonemas, :email, :recusar_emails, :site, :qtde_funcionarios, :qtde_cnpj, :setor, :receita_anual, :tipo_interesse, :produtos_interesse)
    end
end
