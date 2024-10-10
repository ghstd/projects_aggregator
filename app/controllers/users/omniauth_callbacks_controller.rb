# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def facebook
    auth = request.env['omniauth.auth']
    oauth_handler(auth)
  end

  def google_oauth2
    auth = request.env['omniauth.auth']
    oauth_handler(auth)
  end

  def github
    auth = request.env['omniauth.auth']
    oauth_handler(auth)
  end

  private

  def oauth_handler(auth)

    if auth.info.email.blank?
      flash[:alert] = "Your #{auth.provider || 'provider'} account don't have an email."
      redirect_to root_path
      return
    end

    @user = User.find_or_create_by(email: auth.info.email) do |user|
      user.attributes = {
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        uid: auth.uid,
        provider: auth.provider
      }
    end

    if @user.persisted?
      if @user.provider != auth.provider
        @user.update(name: auth.info.name, uid: auth.uid, provider: auth.provider)
      end

      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:alert] = "Couldn't sign in with #{auth.provider || 'this provider'}."
      redirect_to root_path
    end

  end

  def failure
    flash[:alert] = "Couldn't sign in with this provider"
    redirect_to root_path
  end

end
