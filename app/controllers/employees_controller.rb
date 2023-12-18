class EmployeesController < ApplicationController

    before_action :set_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all
    end

    def new 
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employees_path,
            notice: "Employee was successfully created."
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @employee.update(employee_params)
            redirect_to employees_path,
            notice: "Employee was successfully updated."
        else
            render :edit
        end
    end

    def show
    end

    def destroy
        @employee.destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :personal_email, :city, :state, :country, :pincode, :address_line_1, :address_line_2)
    end

    def set_employee
        @employee = Employee.find(params[:id])
        rescue ActiveRecord::RecordNotFound => error
        redirect_to employees_path
        flash[:notice] = error
    end
end