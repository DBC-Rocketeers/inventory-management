class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_employee
    @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
  end
  helper_method :current_employee

  def authorize
    redirect_to '/login' unless current_employee
  end
end
