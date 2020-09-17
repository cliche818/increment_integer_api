Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'users/sign_up', to: 'registrations#create'
  post 'users/sign_in', to: 'registrations#sign_in'

  namespace :v1 do
    get '/current', to: 'user_numbers#current'
    get '/next', to: 'user_numbers#next'
    put '/reset', to: 'user_numbers#reset'
  end
end
