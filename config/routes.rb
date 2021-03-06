Rails.application.routes.draw do
  devise_for :users
	resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
	resources :events do
    resources :participations
    resources :pictures, only: [:new, :create]
  end
  
  get 'static_pages/index'
  get 'static_pages/secret'

  # root 'static_pages#index'
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
