require 'rails_helper'

RSpec.describe RegistrationsController do
  describe '#create' do
    it 'should create the user and return the api_token' do
      post :create, params: { email: 'abc@gmail.com', password: '123456'}

      expect(User.count).to eq(1)
      user = User.first
      expect(user.email).to eq('abc@gmail.com')
      expect(user.api_token).to_not be_nil
    end

    it 'should return the json with the user \'s api token' do
      post :create, params: { email: 'abc@gmail.com', password: '123456'}

      json = JSON.parse(response.body)

      user = User.first

      expect(json['data']['id']).to eq(user.id.to_s)
      expect(json['data']['type']).to eq('user')
      expect(json['data']['attributes']['api_token']).to eq(user.api_token)
      expect(json['data']['attributes']['email']).to eq(user.email)
    end

    it 'should not create a user with an existing user' do
      create(:user, email: 'abc@gmail.com')
      post :create, params: { email: 'abc@gmail.com', password: '123456'}

      expect(User.count).to eq(1)
    end
  end
end