Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    root 'dashboard#index'
    delete '/admins/sign_out', to: 'devise/sessions#destroy', as: :destroy_admin_session
    resources :confessions, only: [:index, :show, edit, update, :destroy]
    resources :casual_posts, only: [:index, :show, edit, update :destroy]
    resources :rants, only: [:index, :show, edit, update, :destroy]
  end
  
  root 'welcome#index'
  get 'category_selection', to: 'welcome#category_selection'
  get 'rant', to: 'rants#rant_page'
  get 'casual_post_page', to: 'casual_posts#casual_post_page'
  get 'confession_page', to: 'confessions#confession_page'

  resources :confessions, only: [:index, :new, :create, :show]
  resources :casual_posts, only: [:index, :new, :create, :show]
  resources :rants, only: [:index, :show, :new, :create]
end
