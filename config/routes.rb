Rails.application.routes.draw do
  get 'uploaders/create'
  resources :uploaders
  resources :comments
  resources :todolists do
    put :sort, on: :collection
    resources :tasks
  end
  resources :tasks do
    put :sort, on: :collection
    collection do
      get 'check'
    end
  end
  get 'welcome/index'
  get 'welcome/users'
  root 'welcome#index'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks"
  }do


    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session


end
end
