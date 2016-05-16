class SiteController < ApplicationController

  layout :resolve_layout

  def home
    if user_signed_in? 
      redirect_to "/profile"
    end
  end

  def contact
  end

  def support
  end

private

  def resolve_layout
    if user_signed_in? 
      "application"
    end
  end
end
