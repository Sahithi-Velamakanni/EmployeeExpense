class BillController < ApplicationController
    # def new_bill
    #   m = EmployeeHelper.create_bill_detail_records(params["bills"],params['user_id'])
    #   render :json => m
    # end
    def new_bill
      # binding.pry
      bills=BillDetail.create(bill_params[:bill_details])
      if !bills.blank?
       render json: bills, adapter: :json, status: 201
      else
        render json: {error: bill_detail.error}, status: 401
      end
    end  
    private
    def bill_params
      # params.require(:bill_details).each do |bill_detail|
      #   bill_detail.permit(:emplyoee_detail_id,:invoice_no,:date,:description,:amount)
      # end
      params.permit(bill_details: [:emplyoee_detail_id,:invoice_no,:date,:description,:amount])
    end
    
end
