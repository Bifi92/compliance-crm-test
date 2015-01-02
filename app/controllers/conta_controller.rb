class ContaController < ApplicationController
  before_action :set_contum, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @conta = Contum.where(:proprietario_user_id => current_user.id)
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
      @contum = Contum.find(params[:id])
    end

    def contum_params
      params.require(:contum).permit(:nome, :razao_social, :fantasia, :cpf_cnpj, :qtde_funcionarios, :propriedade, :tipo_conta, :setor, :receita_anual, :fax, :telefone, :email_nfe, :site, :inscricao_municipal, :inscricao_estadual, :bairro_cobr, :rua_cobr, :numero_cobr, :complemento_cobr, :cep_cobr, :bairro_entr, :rua_entr, :numero_entr, :complemento_entr, :cep_entr, :descricao, :excluida, :countrycobr_country_id, :estadocobr_estado_id, :cidadecobr_cidade_id, :countryentr_country_id, :estadoentr_estado_id, :cidadeentr_cidade_id)
    end
end
