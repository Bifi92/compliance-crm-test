Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :contatos

  resources :conta

  resources :leads
  
  devise_for :users

  devise_scope :user do
  	root to: 'devise/sessions#new'

  	match 'start_page' => 'home#index', via: 'get'

 	  get 'sign_in', to: "devise/sessions#new"
  end
  
  match "/cidades_por_estado" => "cidades#cidades_por_estado", via: 'get'

  match "/estados_por_pais" => "estados#estados_por_pais", via: 'get'

  match "/cidades_nil" => "cidades#cidades_nil", via: 'get'
  
  match "/leads/:id/convert" => "leads#convert", via: 'get', as: :convert_lead
  match "/leads/:id/convert" => "leads#execute_conversion", via: 'post', as: :execute_conversion

end
