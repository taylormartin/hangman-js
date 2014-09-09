Rails.application.routes.draw do
  devise_for :users

  resources :hangmen, only: [:index, :show, :create, :update]

  get '/ajax_test' => 'hangmen#ajax_test'

  root to: "static_pages#home"
end
