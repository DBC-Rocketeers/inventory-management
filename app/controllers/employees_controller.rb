class EmployeesController < ApplicationController


  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.create(employee_params)
    # redirect_to employee_path(@employee)
    @employee
  end

  def new
    @employee = Employee.new
  end


  private
  def employee_params
    params.require(:employee).permit(:name, :employee_id, :password)
  end
end
