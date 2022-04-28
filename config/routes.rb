# frozen_string_literal: true

require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use(ActionDispatch::Cookies)
Sidekiq::Web.use(Rails.application.config.session_store, Rails.application.config.session_options)

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/health_check', to: proc { [200, {}, ['success']] }

  namespace :v1 do
    resources :users
  end
end
