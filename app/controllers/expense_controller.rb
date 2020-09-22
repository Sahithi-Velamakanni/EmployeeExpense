class ExpenseController < ApplicationController
    def new_expense
        expense=Expense.create(:emplyoee_detail_id =>params['emplyoee_detail_id'])
        bills=expense.bill_details.create(bill_params[:bill_details])
        begin
            ExpenseHelper.do_system_validation(bills)
        rescue
            []
        end
        unless bills.blank?
         render json: bills, adapter: :json, status: 201
        else
          render json: {error: bills.error}, status: 401
        end
    end  
    def admin_expense_action
        @bill_details = ExpenseHelper.update_admin_action(params)
        employee = EmplyoeeDetail.find params[:employee_id].to_i
        EmployeeMailer.with(bill_details: @bill_details, user_name: employee.name).expense_mail(employee.email_id).deliver
        unless @bill_details.blank?
          render json: @bill_details, adapter: :json, status: 201
        else
          render json: {error: "there has been an internal error"}, status: 401
        end

    end
    def search
        bill_details  = ExpenseHelper.search(params)
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
