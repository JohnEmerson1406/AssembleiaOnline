Rails.application.routes.draw do
  resources :home
  resources :assemblies

  namespace :admin do
    resources :topics
    resources :users
    resources :pre_registrations 
    resources :assemblies do
      collection do
        put ':id/open_close_state', to: 'assemblies#open_close_state'
      end
    end
  end
  
  devise_for :users

  patch 'admin/users/:id/set_paid', to:'admin/users#set_paid', as: :set_paid
  patch 'admin/users/:id/set_not_paid', to:'admin/users#set_not_paid', as: :set_not_paid
end
