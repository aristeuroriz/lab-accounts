Rails.application.routes.draw do

  devise_for :users,
  #only: [],
  controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'registrations',
    sessions: 'sessions'
  },
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  },
  defaults: {format: :json}

  resources :records

  root to: "records#index"

  scope :auth do
    get 'is_signed_in', to: 'auth#is_signed_in?'
  end
end
