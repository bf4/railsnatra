require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../app/middlewares/logger',  __FILE__)
use LoggerMiddleware, "1 - web server"
run Rails.application
