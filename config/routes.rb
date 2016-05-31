Rails.application.routes.draw do
  resources :blogs do
    member do
      get 'ajax_update'
    end
  end

  root to: 'visitors#index'
  devise_for :users, path: "", controllers: {registrations: "users/registrations", sessions: "users/sessions" }, path_names: { sign_in: 'login', password: 'forgot', sign_up: 'register', sign_out: 'signout', edit: 'settings'}
  resources :users do
    member do
      get 'profile'
    end
  end
end
 