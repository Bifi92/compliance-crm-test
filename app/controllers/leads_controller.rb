class LeadsController < ApplicationController
  before_action :require_authentication
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @leads = Lead.not_converted_by_user_id(current_user.id).page(params[:page])
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
    set_lead
  end  

  def execute_conversion
    
    set_lead    
    enviar_email = params[:enviar]
    enviar_email = 0 if enviar_email.nil?    
    conta_id = params[:conta_id]
    proprietario_user_id = params[:proprietario_user_id]

    conta_id = @lead.execute_conversion(current_user.id, proprietario_user_id, conta_id, enviar_email)

    redirect_to contum_path(conta_id)
    
  end   

  private
    def set_lead
      @lead = Lead.find(params[:id])
    end

    def lead_params
      params.require(:lead).permit(:saudacao, :empresa, :nome, :sobrenome, :titulo, :status, :descricao, :erp, :solucao_fiscal, :country_id, :estado_id, :cidade_id, :rua, :cep, :origem, :reconhecido, :classificacao, :motivo_desqualificacao, :orcamento_aprovado, :convertido, :data_da_conversao, :fax, :celular, :telefone, :recusar_telefonemas, :email, :recusar_emails, :site, :qtde_funcionarios, :qtde_cnpj, :setor, :receita_anual, :tipo_interesse, :produtos_interesse)
    end
end
