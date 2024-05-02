Rails.application.routes.draw do
  root 'gossips#index'
  
  resources :gossips do
    resources :comments, only: [:create, :edit, :update, :destroy]
    member do
      get 'confirm_delete', as: 'confirm_delete'
    end
  end

  # Placez la route de suppression des commentaires avant la définition des ressources :comments
  delete '/comments/:id', to: 'comments#destroy', as: 'comment'

  resources :password_resets, only: [:create, :update]
  get 'password_reset/new', to: 'password_resets#new', as: 'new_password_reset'
  get 'password_reset/edit', to: 'password_resets#edit', as: 'edit_password_reset'

  get 'login', to: 'sessions#new', as: 'new_login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'sessions#new', as: 'new_user_session'

  resources :users, only: [:new, :create, :show]
  get 'users/sign_up', to: 'registrations#new', as: 'new_user_registration'

  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:name', to: 'welcome#show', as: 'welcome'

  resources :cities, only: [:show]

  get '/confirmation', to: 'gossips#confirmation', as: 'confirmation'

  resources :items
end
