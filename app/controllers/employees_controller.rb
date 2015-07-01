class EmployeesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user
  before_filter :authenticate_admin, except: [:index, :show, :edit, :update]
  before_filter :not_current_user, only: [:edit, :update]
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)
      if @employee.save
        redirect_to employees_path
      else
        redirect_to new_employee_path
      end
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to employees_path
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:employee_id, :email, :fullname, :address, :nirthdate, :joindate, :phone, :mobile, :distributor_id, :warehouse_id)
    end
end
