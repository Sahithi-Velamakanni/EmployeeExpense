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
            invoices << {bill_detail.id=>bill_detail.invoice_number}
        end
        response = make_a_external_call_for_invoice_validation(invoices)
        update_bill_status(response)
    end
    def make_a_external_call_for_invoice_validation(invoices)
        begin
            response_status=[]
            invoices.each do |invoice|
                uri = URI.parse('https://my.api.mockaroo.com/invoices.json')
                con=Net::HTTP.new(uri.host, uri.port)
                req= Net::HTTP.Post.new(uri.request_uri,{'API-Key': 'b490bb80'})
                req.body = {"invoice_id" =>invoice[1]}
                response = con.request(req)
                response_status << { invoice[0]=>response.to_json['status']}
            end
            return response_status
        rescue
            nil 
        end
        []
    end
    def update_bill_status(response)
        response.each do |bill|
            b = BillDetail.find(bill[0])
            b.status=(bill[1]==true) ? "SA":"SR" 
            b.save!
        end
    end
end