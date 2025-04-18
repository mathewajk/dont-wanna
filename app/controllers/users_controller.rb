class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
    def user_params
      params.expect(user: %i[ email_address password password_confirmation ])
    end
end
