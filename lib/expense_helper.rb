require('net/http')
require('json')
module ExpenseHelper
    def self.search(params)
        bill_details=[]
        employee_details = EmplyoeeDetail.where('name LIKE ? OR id = ?',params['id'],params['id'])
        employee_details.each do |employee|
            (bill_details << BillDetail.where(:emplyoee_detail_id=>employee.id)).flatten!
        end
        bill_details
    end
    def self.do_system_validation(bill_details)
        invoices=[]
        bill_details.each do |bill_detail|
            invoices << {bill_detail.id=>bill_detail.invoice_no}
        end
        response = make_a_external_call_for_invoice_validation(invoices)
        update_bill_status(response)
    end
    def self.make_a_external_call_for_invoice_validation(invoices)
        begin
            response_status=[]
            invoices.each do |invoice|
                uri = URI.parse('https://my.api.mockaroo.com/invoices.json')
                con=Net::HTTP.new(uri.host, uri.port)
                con.use_ssl = true
                con.verify_mode = OpenSSL::SSL::VERIFY_NONE
                req= Net::HTTP::Post.new(uri.request_uri)
                req.add_field 'X-API-Key', 'b490bb80'
                req.body = {"invoice_id" =>invoice.values[0]}.to_json
                res = con.request(req)
                response = JSON.parse(res.body)
                response_status << { invoice.keys[0]=>response['status']}
            end
            return response_status
        rescue
            nil 
        end
        []
    end
    def self.update_bill_status(response)
        response.each do |response|
            b = BillDetail.find(response.keys[0])
            b.status=(response.values[0]==true) ? "SA":"SR" 
            b.save!
        end
    end
    def self.update_admin_action(params)
        bill_details=[]
        if(params['type']=='bill')
            params['expense'].each do |expense|
                binding.pry
                bill=BillDetail.find expense['id'].to_i
                bill.status=expense['status']
                bill.save!
                bill_details << bill
            end
        else
            params['expense'].each do |expense|
                binding.pry
                expense_record = Expense.find expense['id'].to_i
                expense_record.bill_details.each do |bill|
                    bill.status=expense['status']
                    bill.save!
                    bill_details << bill
                end

            end
        end
        bill_details
    end
end