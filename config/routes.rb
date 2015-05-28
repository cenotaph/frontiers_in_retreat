Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#home'
  resources :artists do
    resources :residencies
  end
  resources :pages
  resources :posts
  resources :sites do
    resources :residencies
  end

  get '/admin' => 'admin/posts#index'

  get '/blog' => 'posts#blog'


  namespace :admin do
    resources :artists
    resources :events
    resources :pages
    resources :posts
    resources :projects
    resources :residencies
    resources :sites
    resources :users
  end
  
end
