Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'
  root 'top#index'
  get 'top/index'
  devise_for :users
  
  resources :events, only: [:new, :create, :show] do
    collection do
      get 'map'
    end
    member do
      post 'add_study_group'
      delete 'exit_study_group'
    end
  end

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    member do
      get 'follows'
      get 'followers'
    end
  end
end