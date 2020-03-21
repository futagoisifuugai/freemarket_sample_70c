Rails.application.routes.draw do
  get 'credit_cards/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    
  }
  root  "tops#index"
  resources :tops, only: [:index,:show,:new]  
    
  resources :user_adresses, only: [:index,:new,:create]
  resources :credit_cards, only: [:index, :new, :show,:delete] do
    collection do
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
