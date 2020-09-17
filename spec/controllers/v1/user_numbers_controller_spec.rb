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
      it 'should return the next number for the associated token user and permanently increases the number' do
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

    describe '#reset' do
      it 'should reset the number 1 for the associated token user and return it' do
        user = create(:user)
        request.headers.merge!({ 'Authorization' => "Bearer #{user.api_token}" })
        put :reset, params: {number: 1}

        json = JSON.parse(response.body)
        expect(json['data']['id']).to eq(user.id.to_s)
        expect(json['data']['type']).to eq('user')
        expect(json['data']['attributes']['number']).to eq(1)

        user.reload
        expect(user.number).to eq(1)
      end

      it 'should reset the number 1001 for the associated token user and return it' do
        user = create(:user)
        request.headers.merge!({ 'Authorization' => "Bearer #{user.api_token}" })
        put :reset, params: {number: 1001}

        json = JSON.parse(response.body)
        expect(json['data']['id']).to eq(user.id.to_s)
        expect(json['data']['type']).to eq('user')
        expect(json['data']['attributes']['number']).to eq(1001)

        user.reload
        expect(user.number).to eq(1001)
      end

      it 'should return an error message if the number is invalid and the number remains unchanged' do
        user = create(:user)
        request.headers.merge!({ 'Authorization' => "Bearer #{user.api_token}" })
        put :reset, params: {number: -10}

        json = JSON.parse(response.body)
        expect(response.status).to eq(400)
        expect(json['errors']['status']).to eq('400')
        expect(json['errors']['title']).to eq('Invalid number')
        expect(json['errors']['detail']).to eq('Need to be a number from 0 and above')

        user.reload
        expect(user.number).to eq(0)
      end

      it 'should return an error message if the user api token is invalid' do
        request.headers.merge!({ 'Authorization' => 'Bearer fake_token'})
        put :reset

        json = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(json['errors']['status']).to eq('404')
        expect(json['errors']['title']).to eq('Invalid api token')
        expect(json['errors']['detail']).to eq('Invalid api token')
      end
    end
  end
end
