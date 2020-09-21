module BillHelper
    def self.save_bills
        bill_details.each do |bill|
            bill={}
            b = BillDetail.new(:emp_id => bill['emp_id'] ,:invoice_no =>bill['invoice_no'], 
                :date_of_expense => bill['data_of_expense'],
                :description=>bill['description'] , :amount=>bill['amount'])
           if !b.save 
                @flag=false
            
           end
            bill["bill_id"]=b.id 
            bills << bill     
            invoices << {b.id=>bill['invoice_no']}
        end
    end

end