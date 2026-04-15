Rails.application.routes.draw do
  root "static_pages#top"
  get "static_pages/top"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :stretches, only: %i[index show]
end
