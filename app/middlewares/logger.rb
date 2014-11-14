class LoggerMiddleware
  def initialize(app, message)
    @app = app
    @message = message
  end

  def call(env)
    puts "REQUEST: #@message"
    @app.call(env)
  ensure
    puts "RESPONSE: #@message"
  end
end
