Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Concerns
  concern :likeable do
    resource :likes, only: [:update]
  end

  concern :reportable do
    resource :reports, only: [:create, :show]
  end

  concern :replyable do
    resource :replies, only: [:show, :create]
  end

  # Routes
  root to: 'blogs#index'
  devise_for :users
  resources :dashboard, only: [:index]
  resources :blogs, concerns: [:likeable,:reportable] do
    resources :suggestions, only: [:create, :index, :update], concerns:[:replyable]
    resources :comments, concerns: [:likeable,:reportable, :replyable]
  end
  # resources :comments, only:[:index] , concerns: [:replyable]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
