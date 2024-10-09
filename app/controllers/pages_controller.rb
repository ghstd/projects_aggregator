class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def home
  end

  def about
  end

  def privacy_policy
  end

  def comments_demonstration
  end

  def profile
    resource = current_user
    resource_name = :user

    @only_demonstration = true

    render "devise/registrations/edit", locals: {resource: resource, resource_name: resource_name}
  end

end
