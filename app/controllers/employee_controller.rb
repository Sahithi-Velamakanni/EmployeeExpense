# frozen_string_literal: true
# employee class
class EmployeeController < ApplicationController
  def new
    employee = EmplyoeeDetail.new(employee_params)
    if employee.save
     render json: employee, adapter: :json, status: 201
    else
      render json: {error: employee.error}, status: 401
    end
  end  

  def update_status
    employee=EmplyoeeDetail.find(params['id'].to_i)
    employee.status=params['status']
    employee.user_id=params['user_id']
    if employee.save
      render json: employee, adapter: :json, status: 201
    else
       render json: {error: employee.error}, status: 401
    end
  end
  private
  def employee_params
    params.require('employee').permit('name', 'department','status','user_id','email_id')
  end
end
