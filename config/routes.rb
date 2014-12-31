Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  devise_scope :user do
  	root to: 'devise/sessions#new'

  	match 'start_page' => 'visitors#index', via: 'get'

 	get "sign_in", to: "devise/sessions#new"
	end
end
