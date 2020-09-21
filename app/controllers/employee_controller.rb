# frozen_string_literal: true
# employee class
class EmployeeController < ApplicationController
  before_action :user_authentication , only: [:new,:update_status]
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

  def search
      @employee = EmplyoeeDetail.where('name LIKE ? OR id LIKE ? OR department LIKE ?',params['search'],params['search'],params['search'])
      if @employee.blank?
        render json: {message: "No employee found"}, status: 200
      else
      render json: @employee, adapter: :json, status: 200 
      end
  end

  private
  def employee_params
    params.require('employee').permit('name', 'department','status','user_id','email_id')
  end

 def user_authentication
  user=EmplyoeeDetail.find(params['user_id'].to_i)
  if user.department != 'admin'
    render json: {message: "only admin can update the details"}, status: 400
  end
 end
  
end
