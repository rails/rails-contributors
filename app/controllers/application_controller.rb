class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  filter_parameter_logging :password

  def set_since
    if params[:since].present?
      @since = Date.parse(params[:since]) rescue nil
    end
  end
end
