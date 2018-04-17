class BotKiller
  BLACKLISTED_BOTS = %r{
    FAST    |
    MauiBot
  }xi

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    if request.user_agent =~ BLACKLISTED_BOTS
      [404, {}, ["Not found"]]
    else
      @app.call(env)
    end
  end
end
