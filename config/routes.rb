Rails.application.routes.draw do
  get "records/new"
  get "records/create"
  root "static_pages#top"
  get "static_pages/top"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :stretches, only: %i[index show] do
    resources :records, only: %i[new create]
  end

  resources :records, only: %i[index show]
end
