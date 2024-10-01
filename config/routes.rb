Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "pages#home"

    get 'page/about', to: 'pages#about'
    get 'page/privacy_policy', to: 'pages#privacy_policy'

    resources :pet_projects
  end
end
