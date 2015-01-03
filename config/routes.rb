Rails.application.routes.draw do
  resources :contatos

  resources :conta

  resources :leads

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #root to: 'visitors#index'

  devise_for :users

  devise_scope :user do
  	root to: 'devise/sessions#new'

  	match 'start_page' => 'visitors#index', via: 'get'

 	get "sign_in", to: "devise/sessions#new"
  end
  
  match "/cidades_por_estado" => "cidades#cidades_por_estado", via: 'get'
  match "/estados_por_pais" => "estados#estados_por_pais", via: 'get'
  match "/cidades_nil" => "cidades#cidades_nil", via: 'get'

end
