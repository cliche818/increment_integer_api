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
    end
  end
end
