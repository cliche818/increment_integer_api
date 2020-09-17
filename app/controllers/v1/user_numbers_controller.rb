module V1
  class UserNumbersController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def current
      render json: NumberSerializer.new(@current_user).serializable_hash
    end

    def next
      @current_user.increment_number
      render json: NumberSerializer.new(@current_user).serializable_hash
    end

    def reset
      if params[:number].nil? || !params[:number].match(/^[0-9]+/) || !User.valid_number?(params[:number].to_i)
        render json: {
            errors: {
                status: '400',
                title: 'Invalid number',
                detail: 'Need to be a number from 0 and above'
            }
        }, status: 400 and return
      end
      @current_user.update(number: params[:number])
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
