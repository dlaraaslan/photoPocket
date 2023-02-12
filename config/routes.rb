Rails.application.routes.draw do
  get 'users/index'
  get 'users/:id/show', to: 'users#show', as: 'users_show'
  get 'users/new', to: 'users#new', as: 'new_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  root 'users#index'
end
