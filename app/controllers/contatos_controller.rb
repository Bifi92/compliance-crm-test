class ContatosController < ApplicationController
  before_action :require_authentication
  before_action :set_contato, only: [:show, :edit, :update, :destroy]
  before_action :check_user_owner, only: [:show, :edit]

  respond_to :html

  def index
    @contatos = Contato.by_user_id(current_user.id).page(params[:page])
    respond_with(@contatos)
  end

  def show
    respond_with(@contato)
  end

  def new
    @contato = Contato.new
    respond_with(@contato)
  end

  def edit
  end

  def create
    @contato = Contato.new(contato_params)
    @contato.criador_user_id = current_user.id
    @contato.proprietario_user_id = current_user.id
    @contato.ultimoalterar_user_id = current_user.id    
    @contato.save
    respond_with(@contato)
  end

  def update
    @contato.ultimoalterar_user_id = current_user.id
    @contato.update(contato_params)
    respond_with(@contato)
  end

  def destroy
    @contato.destroy
    respond_with(@contato)
  end

  private
    def set_contato
      begin
        @contato = Contato.find(params[:id])
      rescue
        render_404
      end
    end

    def contato_params
      params.require(:contato).permit(:contum_id, :contato_id, :saudacao, :sexo, :titulo, :nome, :sobrenome, :data_nascimento, :empresa, :departamento, :cpf, :descricao, :email_pessoal, :email_corporativo, :nome_assistente, :telefone_assistente, :data_devolucao_email, :motivo_devolucao_email, :recusar_emails, :fax, :recusar_fax, :telefone_residencial, :telefone_comercial, :celular, :outro_telefone, :recusar_telefonemas, :bairro_corre, :rua_corre, :numero_corre, :complemento_corre, :cep_corre, :bairro_corpo, :logradouro, :rua_corpo, :numero_corpo, :complemento_corpo, :cep_corpo, :esporte_preferido, :hobby, :excluido, :origem_lead, :countrycorre_country_id, :estadocorre_estado_id, :cidadecorre_cidade_id, :countrycorpo_country_id, :estadocorpo_estado_id, :cidadecorpo_cidade_id)
    end

    def check_user_owner
      if @contato.proprietario_user_id != current_user.id
        redirect_to contatos_path, alert: "You are not the owner of this object"
      end
    end
end