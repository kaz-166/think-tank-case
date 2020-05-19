Rails.application.routes.draw do
  get 'posts/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "pages#show"
  resources :posts
  resources :pages
  resources :articles
  resources :projects
end
