class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @departments = Department.all
  end

  def create
    employee = Employee.create(employee_params)
    if employee.save
      redirect_to root_path
    else
      render :new
    end
  end

  protected

  def employee_params
    params.require(:employee).permit(:name, :user_id, :full_name, :photo_path, :email_address, :headline, :department_id)
  end

end