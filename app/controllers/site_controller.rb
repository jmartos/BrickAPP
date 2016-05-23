class SiteController < ApplicationController
  skip_before_action :require_login 
  # before_action :resolve_layout

  def home
    if user_signed_in? 
      redirect_to "/profile"
    else
      render(:layout => "layouts/site")
    end
  end

  def contact
    render(:layout => "layouts/application")
  end

  private

  # def resolve_layout
  #   if user_signed_in? 
  #     "application"
  #   else
  #     "site"
  #   end
  # end
end
