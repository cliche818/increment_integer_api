Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'users/sign_up', to: 'registrations#create'

  namespace :v1 do
    get '/current', to: 'user_numbers#current'
  end
end
