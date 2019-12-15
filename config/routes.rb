Rails.application.routes.draw do
  root 'top#index'
  get 'top/index'
  devise_for :users
  resources :events, only: [:new, :create, :show] do
    collection do
      get 'map'
    end
  end
end