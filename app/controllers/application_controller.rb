class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_flash
  private

  def show_flash
    flash.now[:notice] = ["Found the about page!"] if request.path == '/about'

    # Display the
    session[:company_notice_shown] = false
    if not session[:company_notice_shown] and request.path == '/company'
      flash.now[:notice] = ["Search for stock by name"]
      flash.now[:notice] << "Click company symbol to view the last 30 days of stock history"
      session[:company_notice_shown] = true
    end
  end
end
