class StaticPageController < ApplicationController
  def home
    if logged_in?
      redirect_to all_show_path
    end
  end
end
