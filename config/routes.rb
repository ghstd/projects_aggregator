require "sidekiq/web"

Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "pages#home"

    get 'pages/about', to: 'pages#about'
    get 'pages/privacy_policy', to: 'pages#privacy_policy'
    get 'pages/profile', to: 'pages#profile'
    get 'pages/comments_demonstration', to: 'pages#comments_demonstration'

    get 'admin/index', to: 'admin#index'
    get 'admin/show', to: 'admin#show'
    delete 'admin/destroy', to: 'admin#destroy'
    delete 'admin/destroy_log', to: 'admin#destroy_log'

    devise_for :users, skip: :omniauth_callbacks, controllers: { registrations: 'users/registrations' }

    resources :pet_projects, only: [:index, :show]
    resources :comments, except: [:show] do
      resources :replies, except: [:index, :new, :show]
    end
  end

  match '*path', to: 'application#not_found_route', via: :all
end
