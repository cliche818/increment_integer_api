module V1
  class UserNumbersController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def current
      render json: NumberSerializer.new(@current_user).serializable_hash
    end

    private

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        @current_user = User.find_by(api_token: token)
      end
    end
  end
end
