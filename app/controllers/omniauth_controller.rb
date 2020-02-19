class OmniauthController < ApplicationController
  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash.now[:error] = 'There was a problem signin you in through Facebook. Pleas register or try signin in later'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash.now[:error] = 'There was a problem signin you in through Facebook. Pleas register or try signin in later'
    redirect_to new_user_registration_url
  end
end
