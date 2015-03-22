Rails.application.routes.draw do
  root 'polls#index'

  resources :polls do
    resources :questions
    resources :replies, only: [ :new, :create ]
  end
end
