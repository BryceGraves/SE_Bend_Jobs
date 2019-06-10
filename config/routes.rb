Rails.application.routes.draw do
  resources :businesses do
    resources :jobs, except: [ :index ]
  end

  resources :jobs, only: [ :index ]
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
