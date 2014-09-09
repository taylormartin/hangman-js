Rails.application.routes.draw do
  devise_for :users

  get "hangmen/challenge" => "hangmen#challenge"
  post "hangmen/challenge" => "hangmen#create_challenge"

  resources :hangmen, only: [:index, :show, :create, :update]

  root to: "static_pages#home"
end
