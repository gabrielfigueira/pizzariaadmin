class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ExceptionLogger::ExceptionLoggable # loades the module
  rescue_from Exception, :with => :log_exception_handler # tells rails to forward the 'Exception' (you can change the type) to the handler of the module
end
