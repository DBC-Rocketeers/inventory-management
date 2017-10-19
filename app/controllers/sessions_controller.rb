class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.find_by_employee_id(employee_params[:employee_id])
    if employee && employee.authenticate(employee_params[:password])
      session[:employee_id] = employee.id
      flash[:notice] = ["You have successfully logged in."]
      redirect_to '/'
    else
      flash[:alert] = ["Your employee ID or password combination are incorrect."]
      redirect_to '/login'
    end
  end

  def destroy
    session[:employee_id] = nil
    flash[:notice] = ["You have successfully logged out."]
    redirect_to '/login'
  end

  private
  def employee_params
    params.require(:employee).permit(:employee_id, :password)
  end
end
