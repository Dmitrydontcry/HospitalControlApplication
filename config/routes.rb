Rails.application.routes.draw do
  resources :attachments
  devise_for :users

  root "patients#index"

  resources :patients
  resources :analyses

  get "attachments/download/:id", to: "attachments#download", as: :attachments_download

end
