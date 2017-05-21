Rails.application.routes.draw do
  resources :todolists do
    resources :tasks
  end
  resources :tasks do
    put :sort, on: :collection
    collection do
      get 'check'
    end
  end
  get 'welcome/index'
  root 'welcome#index'

  devise_for :users, :controllers => {
      :omniauth_callbacks => "users/omniauth_callbacks"
  }do


    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session


end
end
