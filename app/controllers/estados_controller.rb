class EstadosController < ApplicationController
	before_action :require_authentication

  def estados_por_pais
    
    pais_id = params[:id].to_i
    estados = Estado.where(:country_id => pais_id)
    
    est = []
    estados.each do |estado|
      est << {:id => estado.id, :n => estado.nome}
    end
    
    render :json => {:est => est.compact}.as_json

  end

end