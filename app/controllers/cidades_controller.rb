class CidadesController < ApplicationController
  before_action :require_authentication

  def cidades_por_estado
    
    estado_id = params[:id].to_i
    cidades = Cidade.where(:estado_id => estado_id)
    
    cid = []
    cidades.each do |cidade|
      cid << {:id => cidade.id, :n => cidade.nome}
    end
    
    render :json => {:cid => cid.compact}.as_json

  end

  def cidades_nil    
    render :json => {:cid => {}.compact}.as_json
  end

end