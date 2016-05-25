class SiteController < ApplicationController

  skip_before_action :require_login 

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
end
