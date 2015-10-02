require 'resque/server'
require 'resque/scheduler/server'

Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :passwords => "passwords",
    :registrations => "registrations"
  }

  resources :events do
    collection do
      delete 'destroy_all'
    end
  end

  get "home/index", to: "home#index"
  get "home", to: "home#index"
  get "errors/error_404"
  get "errors/error_500"
  get "errors/error_500_fake"

  get "/robots.txt", to: "home#robots"

  mount Resque::Server.new, at: "/resque"
  # You can have the root of your site routed with "root"
  root 'events#index'

  unless Rails.env.development?
    match '*not_found', via: ActionDispatch::Routing::HTTP_METHODS, to: 'errors#error_404'
  end
end
