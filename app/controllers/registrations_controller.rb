class RegistrationsController < ApplicationController
  def create
    existing_user = User.find_by(email: params[:email])

    unless existing_user
      user = User.create!(user_params)
      render json: UserSerializer.new(user).serializable_hash and return
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end