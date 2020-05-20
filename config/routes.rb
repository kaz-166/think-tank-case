Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "pages#show"
  resources :posts
  resources :pages
  resources :articles
  resources :projects
  post '/project/update', to: "users#switch_project"
end
