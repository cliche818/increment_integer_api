module V1
  class UserNumbersController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def current
      render json: NumberSerializer.new(@current_user).serializable_hash
    end

    private

    def authenticate
      authenticate_with_http_token do |token, _options|
        @current_user = User.find_by(api_token: token)
      end

      if @current_user.nil?
        render json: {
            errors: {
                status: '404',
                title: 'Invalid api token',
                detail: 'Invalid api token'
            }
        }, status: 404 and return
      end
    end
  end
end
