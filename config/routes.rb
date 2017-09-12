Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root 'groups#index'
  resources :groups, except: [:index, :show, :delete] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: [] do
    collection do
      get 'search'
    end
  end
end
