Rails.application.routes.draw do
  get 'welcome/home', to: 'welcome#home'
  get 'welcome/about', to: 'welcome#about'
end
