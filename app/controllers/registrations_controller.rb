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

  def sign_in
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user).serializable_hash
    else
      render json: {
          errors: {
              status: '401',
              title: 'Failed to sign in',
              detail: 'Incorrect email/password'
          }
      }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end