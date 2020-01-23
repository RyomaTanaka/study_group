Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'top#index'
  get 'top/index'
  devise_for :users
  
  resources :events do
    collection do
      get 'map'
      get 'search'
    end
    member do
      post 'add_study_group'
      delete 'exit_study_group'
    end
  end

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    collection do
      get 'search'
    end
    member do
      get 'follows'
      get 'followers'
    end
  end
end