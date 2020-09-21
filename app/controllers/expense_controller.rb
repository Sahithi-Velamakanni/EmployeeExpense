class ExpenseController < ApplicationController
    def new_expense
        expense=Expense.create(:emplyoee_detail_id =>params['emplyoee_detail_id'])
        bill=expense.bill_details.create(bill_params[:bill_details])
        unless bill.blank?
         render json: bill, adapter: :json, status: 201
        else
          render json: {error: bill_detail.error}, status: 401
        end
    end  
    def update_status

    end
    def search
        bill_details  = ExpenseHelper.search(params)
        ExpenseHelper.do_system_validation(bill_details)
        if !bill_details.blank?
          render json: bill_details, adapter: :json, status: 200
        else
            render json: {"message":"error could not find the details"}, adapter: :json, status: 400
        end
    end
    private
    def bill_params
        params.permit(:emplyoee_detail_id,bill_details: [:invoice_no,:date,:description,:amount])
    end
end
