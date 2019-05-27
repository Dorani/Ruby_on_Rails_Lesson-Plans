Rails.application.routes.draw do

  root 'pages#home'

  resources :articles

  get 'signup', to: 'users#new'
  resource :users, except: [:new]

end
