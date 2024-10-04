Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "pages#home"

    get 'pages/about', to: 'pages#about'
    get 'pages/privacy_policy', to: 'pages#privacy_policy'

    devise_for :users, skip: :omniauth_callbacks, controllers: { registrations: 'users/registrations' }

    resources :pet_projects
    resources :comments
  end
end
