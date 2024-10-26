Rails.application.routes.draw do
  get "home/index"
  resources :messages
  resources :rooms
  resources :categories do
    resources :tasks 
  end

  resources :tasks do
    member do
      patch 'complete'
    end
  end

  root 'tasks#index'
end
