require 'rails_helper'

module V1
  RSpec.describe UserNumbersController do
    describe '#current' do
      it 'should return the associated token user\'s number' do
        user = create(:user)
        request.headers.merge!({ 'Authorization' => "Bearer #{user.api_token}" })
        get :current

        json = JSON.parse(response.body)
        expect(json['data']['id']).to eq(user.id.to_s)
        expect(json['data']['type']).to eq('user')
        expect(json['data']['attributes']['number']).to eq(user.number)
      end

      it 'should return an error message if the user api token is invalid' do
        request.headers.merge!({ 'Authorization' => 'Bearer fake_token'})
        get :current

        json = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(json['errors']['status']).to eq('404')
        expect(json['errors']['title']).to eq('Invalid api token')
        expect(json['errors']['detail']).to eq('Invalid api token')
      end
    end

    describe '#next' do
      it 'should return the next number for the associated token user' do
        user = create(:user)
        current_number = user.number
        request.headers.merge!({ 'Authorization' => "Bearer #{user.api_token}" })
        get :next

        json = JSON.parse(response.body)
        expect(json['data']['id']).to eq(user.id.to_s)
        expect(json['data']['type']).to eq('user')
        expect(json['data']['attributes']['number']).to eq(current_number + 1)

        user.reload
        expect(user.number).to eq(current_number + 1)
      end

      it 'should return an error message if the user api token is invalid' do
        request.headers.merge!({ 'Authorization' => 'Bearer fake_token'})
        get :next

        json = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(json['errors']['status']).to eq('404')
        expect(json['errors']['title']).to eq('Invalid api token')
        expect(json['errors']['detail']).to eq('Invalid api token')
      end
    end
  end
end
