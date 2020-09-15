FactoryBot.define do
  factory :user do
    email { 'first_user@gmail.com' }
    password { 'password' }
    api_token { 'api_token_123' }
  end
end