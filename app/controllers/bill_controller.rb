class BillController < ApplicationController
    def new_bill
      m = EmployeeHelper.create_bill_detail_records(params["bills"],params['user_id'])
      render :json => m
    end
    
end
