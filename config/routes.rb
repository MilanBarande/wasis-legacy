Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :workplaces do
    resources :workplacephotos, only: [:create, :destroy]
    resources :visits, only: [:create, :update]
    resources :reviews, only: [:create, :update]
    resources :favourites, only: :create
  end

  resources :visits, only: :destroy
  resources :reviews, only: :destroy
  resources :favourites, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
