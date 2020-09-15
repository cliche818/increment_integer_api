class RegistrationsController < ApplicationController
  def create
    existing_user = User.find_by(email: params[:email])

    unless existing_user
      User.create!(user_params)
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end