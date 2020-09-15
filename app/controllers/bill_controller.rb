class BillController < ApplicationController
    # def new_bill
    #   m = EmployeeHelper.create_bill_detail_records(params["bills"],params['user_id'])
    #   render :json => m
    # end
    def new_bill
      bills=BillDetail.create(bill_params)
      if 
       render json: bills, adapter: :json, status: 201
      else
        render json: {error: billa.error}, status: 401
      end
    end  
    private
    def bill_params
      params.require('bills').permit('bills','user_id')
    end
    
end
