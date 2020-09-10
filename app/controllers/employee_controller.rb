# frozen_string_literal: true
# employee class
class EmployeeController < ApplicationController
  include EmployeeHelper
  def new
    m = {}
    m = EmployeeHelper.create_employee_record(params['user_id'],params['employee'])
    render :json => m.to_json
  end  

  def update_status
    m={}
    m = EmployeeHelper.update_employee_status(params['user_id'],params['emp_id'].to_i,params['statuss'])
    render :json => m.to_json
  end
end
