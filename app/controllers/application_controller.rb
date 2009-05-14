class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  filter_parameter_logging :password

  before_filter :trace_user_agent

private
  def set_since
    if params[:since].present?
      @since = Date.parse(params[:since]) rescue nil
    end
  end

  BOTS_REGEXP = %r{
    Baidu        |
    Gigabot      |
    Google       |
    libwww-perl  |
    lwp-trivial  |
    msnbot       |
    SiteUptime   |
    Slurp        |
    WordPress    |
    ZIBB         |
    ZyBorg       |
    Yahoo        |
    Lycos_Spider |
    Infoseek     |
    ia_archiver  |
    scoutjet     |
    nutch        |
    dts agent    |
    twiceler     |
    ask jeeves
  }xi
  def trace_user_agent
    if request.user_agent =~ BOTS_REGEXP
      logger.info("(BOT) #{request.user_agent}")
    else
      logger.info("(BROWSER) #{request.user_agent}")
    end
  end
end
