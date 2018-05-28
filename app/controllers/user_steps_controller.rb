class UserStepsController < ApplicationController
  include Wicked::Wizard
  steps :personal, :social
  
  def show
    @user = current_user
    render_wizard
  end
  
  def update
    @user = current_user
    @user.update_attributes(user_params)
    render_wizard @user
  end
  
  private

  def redirect_to_wicked_finish
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:name, :bio, :twitter_username, :github_username, :website)
  end

end
