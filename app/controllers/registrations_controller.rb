class RegistrationsController < ApplicationController
  def create
    existing_user = User.find_by(email: params[:email])

    if existing_user
      render json: {
          errors: {
              status: '403',
              title: 'Failed to create user',
              detail: 'User already exists'
          }
      }, status: 403
    else
      user = User.create!(user_params)
      render json: UserSerializer.new(user).serializable_hash
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end