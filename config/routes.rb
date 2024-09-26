Rails.application.routes.draw do
  root "pages#home"

  get 'page/about', to: 'pages#about'

  resources :pet_projects

end
