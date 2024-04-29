
Rails.application.routes.draw do
  get 'users/show'
  get 'posts/index'
  get 'team', to: 'static_pages#team'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'welcome#show'
  root "posts#index"
  resources :gossips
  resources :users, only: [:show]
end