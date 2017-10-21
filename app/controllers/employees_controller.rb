class EmployeesController < ApplicationController
  before_action :authorize

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = ["You have successfully added new employee, #{@employee.name}."]
      @employee
    else
      flash[:alert] = @employee.errors.full_messages
    end
  end

  def new
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :employee_id, :password, :admin)
  end
end
