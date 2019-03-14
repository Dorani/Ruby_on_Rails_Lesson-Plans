Rails.application.routes.draw do
  resources :articles
  root 'welcome#home'
  get 'about', to: 'welcome#about'
end
