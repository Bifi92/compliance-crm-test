class ContaController < ApplicationController
  before_action :require_authentication
  before_action :set_contum, only: [:show, :edit, :update, :destroy]
  before_action :check_user_owner, only: [:show, :edit]

  respond_to :html

  def index
    @conta = Contum.by_user_id(current_user.id).page(params[:page])
    respond_with(@conta)
  end

  def show
    respond_with(@contum)
  end

  def new
    @contum = Contum.new
    respond_with(@contum)
  end

  def edit
  end

  def create
    @contum = Contum.new(contum_params)
    @contum.criador_user_id = current_user.id
    @contum.proprietario_user_id = current_user.id
    @contum.ultimoalterar_user_id = current_user.id
    @contum.save
    respond_with(@contum)
  end

  def update
    @contum.ultimoalterar_user_id = current_user.id
    @contum.update(contum_params)
    respond_with(@contum)
  end

  def destroy
    @contum.destroy
    respond_with(@contum)
  end

  private
    def set_contum
      begin
        @contum = Contum.find(params[:id])
      rescue
        render_404
      end
    end

    def contum_params
      params.require(:contum).permit(:nome, :razao_social, :fantasia, :cpf_cnpj, :qtde_funcionarios, :propriedade, :tipo_conta, :setor, :receita_anual, :fax, :telefone, :email_nfe, :site, :inscricao_municipal, :inscricao_estadual, :bairro_cobr, :rua_cobr, :numero_cobr, :complemento_cobr, :cep_cobr, :bairro_entr, :rua_entr, :numero_entr, :complemento_entr, :cep_entr, :descricao, :excluida, :countrycobr_country_id, :estadocobr_estado_id, :cidadecobr_cidade_id, :countryentr_country_id, :estadoentr_estado_id, :cidadeentr_cidade_id)
    end

    def check_user_owner
      if @contum.proprietario_user_id != current_user.id
        redirect_to conta_path, alert: "You are not the owner of this object"
      end
    end
end